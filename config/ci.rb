# Run using bin/ci

CI.run do
  step "Setup", "bin/setup --skip-server"

  step "Security: Brakeman code analysis", "bin/brakeman --quiet --no-pager --exit-on-warn --exit-on-error"

  step "Style: Ruby", "bin/rubocop"
  step "Style: ERB Linter", "bin/erb_lint app --format compact"
  step "Style: Biome Linter", "bin/biome"

  step "Tests: RSpec", "bin/rspec"

  # Optional: set a green GitHub commit status to unblock PR merge.
  # Requires the `gh` CLI and `gh extension install basecamp/gh-signoff`.
  # if success?
  #   step "Signoff: All systems go. Ready for merge and deploy.", "gh signoff"
  # else
  #   failure "Signoff: CI failed. Do not merge or deploy.", "Fix the issues and try again."
  # end
end
