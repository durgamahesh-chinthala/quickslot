#!/bin/bash

# QuickSlot Hackathon Checklist
# Run this before the hackathon to verify everything is set up

echo "🚀 QuickSlot Hackathon Pre-Check"
echo "================================"

# Check Flutter
echo -n "✓ Flutter installed: "
flutter --version 2>/dev/null | grep "Flutter" || { echo "❌ FAIL"; exit 1; }

# Check project files
echo -n "✓ Project files: "
[ -f "pubspec.yaml" ] && [ -f "lib/main.dart" ] && echo "✓" || { echo "❌ FAIL"; exit 1; }

# Check dependencies
echo -n "✓ Dependencies fetched: "
[ -d ".dart_tool" ] && echo "✓" || { echo "❌ FAIL - Run: flutter pub get"; exit 1; }

# Check git
echo -n "✓ Git initialized: "
[ -d ".git" ] && echo "✓" || { echo "❌ FAIL"; exit 1; }

# Check Android/iOS
echo ""
echo "📱 Platform Setup:"
flutter doctor -v 2>&1 | head -20

# Verify file structure
echo ""
echo "📁 File Structure:"
echo -n "  Models: "
ls lib/models/*.dart 2>/dev/null | wc -l | xargs echo "files"
echo -n "  Screens: "
ls lib/screens/*.dart 2>/dev/null | wc -l | xargs echo "files"
echo -n "  Providers: "
ls lib/providers/*.dart 2>/dev/null | wc -l | xargs echo "files"
echo -n "  Services: "
ls lib/services/*.dart 2>/dev/null | wc -l | xargs echo "files"

echo ""
echo "✅ Pre-check complete! You're ready to go."
echo ""
echo "📝 Next steps:"
echo "1. Follow SETUP.md to configure Firebase"
echo "2. Run: flutter run"
echo "3. Test double-booking on two devices"
echo "4. See DEFENSE.md for talking points"
