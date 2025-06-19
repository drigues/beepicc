#!/bin/bash

echo "🔍 Checking Beepi.cc Core Stack..."

echo ""
echo "🛡️  Devise / OmniAuth:"
grep -E "devise|omniauth" Gemfile

echo ""
echo "🎨 Tailwind CSS:"
if [ -f app/assets/builds/tailwind.css ]; then
  echo "✅ tailwind.css found in app/assets/builds"
else
  echo "❌ tailwind.css not found"
fi
grep tailwind app/views/layouts/application.html.erb | grep stylesheet_link_tag

echo ""
echo "⚡ Hotwire (Turbo + Stimulus):"
grep -E "@hotwired/turbo-rails|@hotwired/stimulus" config/importmap.rb

echo ""
echo "📝 SimpleForm / form_with:"
grep simple_form Gemfile
grep -R "form_with" app/views | head -n 3

echo ""
echo "📊 Chartkick / Groupdate:"
grep -E "chartkick|groupdate" Gemfile

echo ""
echo "🚀 Deployment logs (Render, etc.):"
grep -i render log/development.log 2>/dev/null || echo "(check your terminal for Render logs)"

echo ""
echo "📦 Sidekiq:"
grep sidekiq Gemfile

echo ""
echo "🛢️  PostgreSQL:"
grep pg Gemfile
grep postgresql config/database.yml

echo ""
echo "🖼️  ActiveStorage + S3:"
grep amazon config/storage.yml
ls db/migrate | grep active_storage

echo ""
echo "✅ Done. Review each section above."
