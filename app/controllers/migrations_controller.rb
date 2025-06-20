class MigrationsController < ApplicationController
  # 👇 Only run in production to prevent misuse
  def run
    if Rails.env.production?
      begin
        ActiveRecord::Base.connection.migration_context.migrate
        render plain: "✅ Migrations ran successfully"
      rescue => e
        render plain: "❌ Migration failed: #{e.message}", status: 500
      end
    else
      render plain: "🚫 Not allowed outside production", status: 403
    end
  end
end
