$dirs=["/Users/praveeg/projects/sdfe/sdfe-webapp", "/Users/praveeg/projects/sdfe/sdfe-authentication-service"]
def parse_dirs(dirs)
	dirs.each do |dir|
		p "PARSING #{dir}"
		files=pick_most_used_files(dir)
		files.each do |file|
			p "#{date(dir, file[1])} - #{file[1]}"
		end
	end
end

def most_used_files(dir)
	`cd #{dir};git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -10`.split("\n")
end


def date(dir, file)
	`cd #{dir};git log --diff-filter=A --follow --format=%aD -1 -- #{file}`
end

def pick_most_used_files(dir)
	most_used_files(dir).collect { |output| output.split(" ") }.drop(1)
end

parse_dirs($dirs)
