# QuickSlot - Sports Slot Booking App

A Flutter app for booking sports venues with **concurrency-safe double-booking prevention**.

## Architecture

```
┌─────────────┐
│  Flutter    │ (Provider state management)
│  App        │
└──────┬──────┘
       │
       ├─→ AuthProvider (User session)
       ├─→ VenueProvider (Venues list)
       └─→ BookingProvider (Slots + Bookings)
              │
              ├─→ VenueService
              ├─→ SlotService
              └─→ BookingService
                     │
                     └─→ Firestore Transactions (Atomic booking)
                            │
                            ├─ Collections: venues, slots, bookings
                            └─ Prevents: Double-booking via transactions
```

**Key Design Decision**: Firestore **transactions** guarantee atomicity. When two users tap "Book" on the same slot simultaneously, only one gets `isBooked=true`. The other reads `isBooked=true` and gets a clear error message.

## Setup

### Prerequisites

### 1. Firebase Setup
```bash
# Create Firebase project
# 1. Go to https://console.firebase.google.com
# 2. Create new project: "quickslot-hackathon"
# 3. Enable Firestore in US region
# 4. Create collections: venues, slots, bookings

# Initialize FlutterFire
flutterfire configure
```

### 2. Firestore Rules
```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /venues/{document=**} {
      allow read: if true;
    }
    match /slots/{document=**} {
      allow read: if true;
    }
    match /bookings/{document=**} {
      allow read, write: if true;
    }
  }
}
```

### 3. Run the App
```bash
cd quickslot
flutter pub get
flutter run
```

## Key Features

1. **Login Screen**: Select from 3 demo users (Alice, Bob, Charlie)
2. **Venues List**: Browse 3 pre-seeded venues
3. **Slot Selection**: 
   - Date picker (7 days ahead)
   - Hourly slots 6 AM–10 PM
   - Green (available) vs Red (booked)
4. **Booking**: 
   - Confirm booking dialog
   - If slot taken during booking → graceful error message
   - Success notification
5. **My Bookings**: View and cancel bookings
6. **Error/Loading/Empty States**: Handled everywhere

## Concurrency Safety - The Hard Rule ✅

**The Problem**: If Alice and Bob both tap "Book" on the same slot at t=0, we must ensure only one succeeds.

**The Solution**: Firestore Transactions
```dart
await _firestore.runTransaction((transaction) async {
  final slotRef = _firestore.collection('slots').doc(slotId);
  final slotDoc = await transaction.get(slotRef);
  
  if (slotDoc['isBooked'] == true) {
    throw 'SLOT_ALREADY_BOOKED'; // Caught by UI
  }
  
  // Atomically create booking + mark slot as booked
  transaction.set(bookingRef, {...});
  transaction.update(slotRef, {'isBooked': true, 'bookedByUserId': userId});
});
```

Firestore ensures **only one transaction commits**. The second attempt gets a clear error.

## What's Included


## What's Cut (and Why)

| Feature | Status | Reason |
|---------|--------|--------|
| Auth | Hardcoded users | 6h constraint; X-User-Id sufficient |
| Websocket | Not implemented | Polling not required for demo |
| Unit tests | Not added | Focus on core booking logic |
| Docker | Not needed | Firebase handles all backend |
| REST API | Not used | Firestore client SDK sufficient |

## If More Time

1. Real-time slot updates via Firestore listeners
2. Offline cache for My Bookings (Hive)
3. Admin panel to view all bookings
4. Push notifications for new slots
5. Time-of-day filters (morning/afternoon/evening)

## File Structure

```
lib/
├── main.dart                    # App entry
├── firebase_options.dart        # Firebase config
├── models/                      # Data classes
│   ├── user.dart
│   ├── venue.dart
│   ├── slot.dart
│   └── booking.dart
├── services/                    # Firestore logic
│   ├── venue_service.dart
│   ├── slot_service.dart
│   └── booking_service.dart
├── providers/                   # State management
│   ├── auth_provider.dart
│   ├── venue_provider.dart
│   └── booking_provider.dart
└── screens/                     # UI
    ├── login_screen.dart
    ├── home_screen.dart
    ├── venues_screen.dart
    ├── venue_detail_screen.dart
    └── bookings_screen.dart
```

## AI Usage Note

**What Claude Helped With**:

**What I Caught & Fixed**:
1. **Bug**: Slot grid didn't refresh after failed booking → Added manual slot state update in BookingProvider
2. **UX**: Error messages were technical → Made user-friendly ("This slot was just booked")
3. **Race condition**: App didn't wait for Firebase init → Added WidgetsFlutterBinding.ensureInitialized()

## Testing Double-Booking (Live Demo)

1. Open app on Device A (Alice)
2. Open app on Device B (Bob)
3. Both navigate to Court A → 10 AM
4. Both tap "Book" **at the same instant**
5. Alice's booking succeeds ✅
6. Bob sees: "This slot was just booked. Please refresh and try another."
7. Bob taps back → slot grid refreshes → 10 AM now shows RED

## Why Provider State Management


## Commits

Every 45 mins during build:
```
0:00  Initial scaffold
45:   Models + Services
90:   Providers
135:  Venues + Detail screens
180:  Booking flow
225:  My Bookings + Cancel
270:  README + Polish
```

## Troubleshooting

**"PERMISSION_DENIED"**
→ Check Firestore rules. `venues` and `slots` need `allow read: if true`.

**"Instance not initialized"**
→ Ensure `await Firebase.initializeApp()` before `runApp()`.

**Slots don't seed**
→ They seed on first venue access. Navigate to a venue to trigger.

Built for QuickSlot Hackathon | Provider + Firebase | Concurrency-safe ✨
