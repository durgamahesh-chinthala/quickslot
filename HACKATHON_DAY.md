# QuickSlot - Day-of Hackathon Guide

## ⏰ 0:00 — Start (Setup Complete)

Assuming Firebase is already configured (see SETUP.md):

```bash
cd quickslot
flutter clean
flutter pub get
flutter run
```

## 📋 Core Feature Checklist (Must Have)

- [x] User login (3 hardcoded users)
- [x] Browse venues (3 pre-seeded)
- [x] View slots by date (date picker + grid)
- [x] Book a slot (with confirmation)
- [x] Concurrency safety (Firestore transactions)
- [x] My Bookings (list + cancel)
- [x] Error/loading/empty states

## 🎯 10-Minute Demo Script

```
0:00 - "This is QuickSlot, a slot booking app"
0:30 - Tap login, select "Alice"
1:00 - Click on "Court A"
1:30 - Show date picker, select tomorrow
2:00 - Scroll slots, explain green = available, red = booked
2:30 - Tap a green slot → confirm → success
3:00 - Navigate to "My Bookings" → show the booking
3:30 - Tap cancel → booking removed
4:00 - Go back to venue, that slot is now green again
4:30 - "Let's test the hard rule: no double-booking"
5:00 - Log out, log in as "Bob"
5:30 - Bob finds the same slot Alice has booked → RED
6:00 - "Now the live test..."
6:30 - [Two devices] Both tap book simultaneously → only one succeeds
7:00 - "Here's the tech: Firestore transactions prevent this"
8:00 - Open code → show booking_service.dart transaction
9:00 - Explain Provider architecture
10:00 - "Questions?"
```

## 🔴 The Live Double-Booking Test (Critical)

**Equipment needed**:
- Device A (your phone/emulator)
- Device B (judge's phone or second emulator)
- Same WiFi network

**Steps**:
1. Start app on Device A as "Alice"
2. Start app on Device B as "Bob"
3. Both navigate to: Court A → Tomorrow → 3 PM slot (find one that's available)
4. Use a stopwatch app: "Starting in 3... 2... 1... TAP!"
5. Both tap "Book" simultaneously
6. **Expected result**:
   - Alice: ✅ "Booking successful!"
   - Bob: ❌ "This slot was just booked. Please refresh and try another."
7. Navigate Bob back to slot grid → 3 PM shows RED

**Why this matters**: Judges will test this. It's the "hard rule". Don't skip it.

## 🛠️ Quick Troubleshooting

| Problem | Fix |
|---------|-----|
| App crashes on start | Check Firebase init in main.dart |
| "PERMISSION_DENIED" errors | Verify Firestore rules (SETUP.md step 4) |
| Slots don't show | Navigate to a venue (seeds on first access) |
| Can't select users | Check auth_provider.dart has 3 demo users |
| Booking doesn't save | Check Firestore rules allow write to bookings |

## 🎤 If They Ask...

**"Walk us through the concurrency logic"**
→ Open booking_service.dart, show transaction (line 25)

**"Why Provider and not Bloc?"**
→ "Scope constraint. Less boilerplate, same performance."

**"What if Firebase goes down?"**
→ "Users see error, retry works. No crash."

**"Show us one small new feature"**
→ Add `bookedByUserId` display in venue_detail_screen.dart slot tiles

**"How'd you handle this in 6 hours?"**
→ "Focused on core: booking + safety. Cut auth, tests, polish."

## 📊 Code Structure (If They Ask)

- **models/** - Data classes (4 files)
- **services/** - Firestore logic (3 files)
- **providers/** - State management (3 files)
- **screens/** - UI (5 files)

**Key file**: `services/booking_service.dart` — This is where the magic happens

## ✅ Success Criteria

- [ ] App starts without crashes
- [ ] Can book a slot
- [ ] Can see My Bookings
- [ ] Can cancel a booking
- [ ] Double-booking test passes on two devices
- [ ] You can explain every design decision in 30 seconds

## 🚫 What NOT to Do

- Don't explain REST APIs (not used here)
- Don't talk about things you didn't build (admin panel, tests, etc.)
- Don't make excuses for bugs — own them and explain fixes
- Don't code live during demo (just explain existing code)

## 📱 Device Setup

### Option 1: Android Emulator
```bash
flutter emulators
# Choose one, or: flutter emulators --launch Pixel_5_API_31
flutter run
```

### Option 2: Physical Device
```bash
# Connect USB + enable ADB
adb devices
flutter run
```

### Option 3: Both (For double-booking test)
```bash
# Terminal 1
flutter run -d emulator-5554

# Terminal 2
flutter run -d emulator-5556
```

## 🎁 Bonus (If You're Ahead of Schedule)

1. **Add real-time updates**: Change slots to use `StreamBuilder` instead of manual refresh
2. **Add time filters**: "Show only 6-12 AM slots"
3. **Offline cache**: Use Hive to cache My Bookings locally
4. **Unit test**: Add test for `BookingService.bookSlot()`

## 🏁 Final Checklist Before Demo

- [ ] Emulator/device is on and responsive
- [ ] App compiles (`flutter run` works)
- [ ] Can login as any user
- [ ] Can navigate through all 5 screens
- [ ] No console errors
- [ ] Firebase is configured (collections exist)
- [ ] Read DEFENSE.md (talking points)
- [ ] Know the transaction code (bookmark it)

---

**Good luck! Show them what you built. 🚀**
