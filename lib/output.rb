# rubocop:disable Security/Open
module Output
  def self.check(houses, result_file = '../lib/search_result.json')
    if File.exist?(result_file)
      old_results = JSON.parse(open(result_file).read)
      compare_results(old_results, houses)
    else
      File.new(result_file, 'w')
    end

    File.open(result_file, 'w') do |file|
      file << JSON.generate(houses)
    end
  end


end

# rubocop:enable Security/Open