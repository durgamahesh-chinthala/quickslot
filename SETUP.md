# QuickSlot Firebase Setup Guide

## 1. Create Firebase Project

```bash
# Option A: Via Console (Recommended)
1. Go to https://console.firebase.google.com
2. Click "Add project"
3. Project name: `quickslot-hackathon`
4. Create project (takes ~30s)
```

## 2. Enable Firestore

```
1. In Firebase console, click "Firestore Database"
2. Click "Create database"
3. Choose region: `us-central1` (default)
4. Start in production mode
5. Click "Enable"
```

## 3. Create Collections (Manual or via App)

**Option A: Manual (Recommended for testing)**

In Firebase console:
```
Collections to create:
- venues (will auto-seed on app first run)
- slots (will auto-seed on first venue access)
- bookings (auto-created on first booking)
```

**Option B: Auto-seeding (via Flutter app)**
The app seeds automatically. Just create empty `venues` collection.

## 4. Set Firestore Security Rules

```bash
# In Firebase console → Firestore Database → Rules tab, replace with:
```

```firestore
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // Venues: public read
    match /venues/{venueId} {
      allow read: if true;
    }

    // Slots: public read
    match /slots/{slotId} {
      allow read: if true;
    }

    // Bookings: public for demo
    match /bookings/{bookingId} {
      allow read, write: if true;
    }
  }
}
```

Click "Publish"

## 5. Configure Flutter App

### Automatic (Recommended)

```bash
# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure project
flutterfire configure \
  --project=quickslot-hackathon \
  --platforms=ios,android

# This auto-generates `lib/firebase_options.dart`
```

### Manual (If FlutterFire CLI fails)

1. Get your project ID from Firebase console (Settings → Project ID)
2. Update `lib/firebase_options.dart` with your keys:
   - Android API Key: Settings → Your apps → Android
   - iOS API Key: Settings → Your apps → iOS

## 6. Verify Setup

```bash
cd my_test_application
flutter clean
flutter pub get
flutter run

# Check logs:
# ✅ "Firebase initialized"
# ✅ App loads without permission errors
```

## 7. Test Double-Booking

### Single Device

1. Login as Alice
2. Go to a venue → pick a slot → Book ✅
3. Logout
4. Login as Bob
5. Go to same venue → same slot → Shows RED (booked) ✅

### Two Devices (Live Demo)

```
Device A (Alice):
- Login as Alice
- Navigate to Court A → 10:00 AM

Device B (Bob):
- Login as Bob
- Navigate to Court A → 10:00 AM

Synchronized tap (use countdown):
- 3... 2... 1... TAP!
- Alice sees ✅ "Booking successful!"
- Bob sees ❌ "This slot was just booked"

Refresh Bob's slots:
- 10:00 AM now shows RED
```

## 8. Troubleshooting

### "PERMISSION_DENIED"

**Cause**: Firestore rules blocking reads

**Fix**:
```firestore
match /venues/{venueId} {
  allow read: if true;  // Make sure this exists
}
```

### "Instance not initialized"

**Cause**: `Firebase.initializeApp()` didn't run before `runApp()`

**Fix**: Check `main.dart` line 8-9:
```dart
await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
```

### Slots not seeding

**Cause**: Collections don't exist yet

**Fix**: 
1. Create empty `venues` and `slots` collections in Firebase console
2. Or: Run app → navigate to a venue → slots auto-seed

### "Can't find firebaseapp"

**Cause**: `firebase_options.dart` has wrong credentials

**Fix**:
```bash
rm lib/firebase_options.dart
flutterfire configure
```

## 9. Database Schema

### venues
```json
{
  "id": "auto-generated",
  "name": "Court A",
  "location": "Downtown",
  "imageUrl": "",
  "rating": 4.5
}
```

### slots
```json
{
  "id": "auto-generated",
  "venueId": "ref_to_venue",
  "startTime": "2024-01-15T10:00:00.000Z",
  "endTime": "2024-01-15T11:00:00.000Z",
  "isBooked": false,
  "bookedByUserId": null
}
```

### bookings
```json
{
  "id": "auto-generated",
  "userId": "user1",
  "venueId": "ref_to_venue",
  "slotId": "ref_to_slot",
  "bookedAt": "2024-01-15T09:55:00.000Z",
  "startTime": "2024-01-15T10:00:00.000Z",
  "endTime": "2024-01-15T11:00:00.000Z",
  "venueName": "Court A"
}
```

## 10. Production Checklist

- [ ] Firebase project created
- [ ] Firestore database enabled
- [ ] Collections created (venues, slots, bookings)
- [ ] Security rules set
- [ ] FlutterFire configured (or firebase_options.dart updated)
- [ ] `flutter run` works without errors
- [ ] Can create a booking
- [ ] Double-booking prevented on same device
- [ ] Double-booking prevented on two devices (if available)

---

✅ Ready for demo!
