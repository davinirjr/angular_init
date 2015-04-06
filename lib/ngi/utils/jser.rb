# angular_init (short-name: ngi)
# Copyright 2015 Joshua Beam
# github.com/joshbeam/angular_init
# MIT License

module JSer
	# Since ngi is an AngularJS tool and the users
	# are familiar with JavaScript, this class
	# prints a string version of a Ruby hash or array
	# as it would appear in normal JavaScript syntax
	# For example:
	# { "hello" => "world" }
	# becomes:
	# { 'hello': 'world' }
	# and ["some","array"]
	# becomes:
	# ['some','array']
	def to_str
		self.to_s.gsub(/\"/,"'").gsub(/\=\>/,": ")
	end

	# A JSer class
	# Usage:
	#     JSHash.new({"hello" => "world"}).to_str
	class JSHash < Hash
		def initialize(hash)
			super
			hash.each do |key,val|
				self[key] = val
			end
		end

		include JSer
	end

	# Another JSer class
	# Usage:
	#     JSArray.new(["some","array"]).to_str
	class JSArray < Array
		def initialize(array)
			super
		end

		include JSer
	end
end