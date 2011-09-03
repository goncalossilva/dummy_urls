require File.expand_path("../test_helper", File.dirname(__FILE__))

class DummyUrlsGeneratorTest < Rails::Generators::TestCase
  destination File.join(Rails.root)
  tests Dummy::Generators::UrlsGenerator
  arguments []

  setup :create_test_application
  teardown :clean_tmp

  def test_dummy_generates_files_with_correct_amount_using_default_and_user_defined_options
    Dummy::Generators::DataGenerator.start
    run_generator
    
    ["children", "parents", "grand_parents"].each do |model|
      assert_file "test/dummy/urls/#{model}.yml"
    end
    
    all_options = {%w()    => [{:n => "children", :a => "4"}, 
                              {:n => "parents", :a => "2"}, 
                              {:n => "grand_parents", :a => "1"}],
    %w(--divisor=5)       => [{:n => "children", :a => "8"}, 
                              {:n => "parents", :a => "4"}, 
                              {:n => "grand_parents", :a => "2"}],
    %w(--output-folder test/dummy_dinassour) =>
                              [{:n => "children", :a => "4", :f => "test/dummy_dinassour"},
                              {:n => "parents", :a => "2", :f => "test/dummy_dinassour"}, 
                              {:n => "grand_parents", :a => "1", :f => "test/dummy_dinassour"}]}
    
    all_options.each do |options, results|
      clean_dummy
      Dummy::Generators::DataGenerator.start ["--output-folder", "#{results.first[:f] || 'test/dummy'}"]
      run_generator options
      
      results.each do |data|
        folder = data[:f] || "test/dummy"
        header_line = File.read("#{folder}/urls/#{data[:n]}.yml").match(/([^\n]+)/)[0]
        assert_nil header_line.index("\n")
        
        regex = /# '(\w+)' urls generated automatically by dummy at .+ \((\d+) groups of urls\)\./
        results = header_line.match(regex)

        assert_equal data[:n], results[1]
        assert_equal data[:a], results[2]
      end
    end
  end
end

