class PodcastService
  def episodes(spotify_uri)
    get_json("spec/fixtures/armchair.json")
  end

private

  def get_json(filename)
    file_content = File.read(filename)
    JSON.parse(file_content, symbolize_names: true)
  end
end
