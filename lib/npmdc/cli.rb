require 'thor'
require 'npmdc'

module Npmdc
  class Cli < Thor
    default_task :check

    desc 'check', 'Run check'
    method_option :path, desc: 'Path to package.json config'
    method_option :'no-color', desc: 'Disable color', type: :boolean
    method_option :format, desc: "Output format, possible values: #{Npmdc::Formatter::FORMATTERS.keys.join(", ")}"

    def check
      Npmdc::Checker.new(options).call
    end

    map %w[--version -v] => :__print_version
    desc '--version, -v', 'Print gem version'
    def __print_version
      puts Npmdc::VERSION
    end
  end
end
