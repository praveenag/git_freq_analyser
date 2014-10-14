$dirs=["/Users/praveeg/projects/sdfe/sdfe-webapp", "/Users/praveeg/projects/sdfe/sdfe-authentication-service"]
def parse_dirs(dirs)
	dirs.each do |dir|
		x_step = 0
		y_step = 0
		p "PARSING #{dir}"
		files=pick_most_used_files(dir)
		files.each do |file|
			# p "#{date(dir, file[1])} - #{file[0]} - #{file[1]}"
			puts "[#{x_step+=10}, #{y_step+=10}, #{file[0]}],"
		end
	end
end

def most_used_files(dir)
	`cd #{dir};git log --pretty=format: --name-only | sort | uniq -c | sort -rg | head -20`.split("\n")
end


def date(dir, file)
	`cd #{dir};git log --diff-filter=A --follow --format=%aD -1 -- #{file}`
end

def pick_most_used_files(dir)
	most_used_files(dir).collect { |output| output.split(" ") }.drop(1)
end

parse_dirs($dirs)
