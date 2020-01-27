class FileParser
  attr_accessor :webpages
  def file_to_hash(file_directory)
    @webpages = {}
    File.readlines(file_directory).each do |line|
      page, ip_address = line.split
      @webpages[page] = [] if webpages[page].nil?
      @webpages[page] << ip_address
    end
    @webpages
  end

  def most_views
    @most_views = @webpages.transform_values(&:count).sort_by { |_, v| v }.reverse.to_h
    report(@most_views)
  end

  def unique_views
    @uniq_views = @webpages.transform_values { |x| x.uniq.count }.sort_by { |_, v| v }.reverse.to_h
    report(@uniq_views)
  end

  private

  def report(data)
    if data == @most_views
      data.each { |k, v| puts "#{k} #{v} visits." }
    else
      data.each { |k, v| puts "#{k} #{v} unique views." }
    end
  end
end
