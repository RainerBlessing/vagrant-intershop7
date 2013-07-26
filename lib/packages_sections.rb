class PackagesSections
  attr_reader :replacement_string,:string
  def initialize(replacement_string,puppet_packages)
    @replacement_string = replacement_string
    @string = puppet_packages.map{|p| p.to_s}.join("\n")
  end
end
