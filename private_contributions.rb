require 'date'
require 'shellwords'

private_repos = []

File.open('private_repos').each do |private_repo|
  private_repos << private_repo.chomp.shellescape
end

commited_dates = `git --no-pager log --format=%cI`.lines.map(&:chomp)

all_dates = []

private_repos.each do |private_repo|
  all_dates += `git --no-pager -C #{private_repo} log --format=%cI`.lines.map(&:chomp)
end

all_dates.uniq!

dates_to_commit = all_dates - commited_dates

dates = dates_to_commit.map{|date| DateTime.iso8601(date)}.sort

dates.each do |date|
  ENV["GIT_AUTHOR_DATE"] = date.rfc2822
  ENV["GIT_COMMITTER_DATE"] = date.rfc2822

  system "git commit --allow-empty -m '[Private commit]'"
end

system "git push" unless dates.empty?

puts "All commits up to date! 🍺"