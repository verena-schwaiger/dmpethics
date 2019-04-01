module SmwapiHelper
  def addStudy(title="", country="", institution="", description="")

    client = MediawikiApi::Client.new "http://localhost/smw/api.php"
    client.log_in "Verena@editbot", "nq78aakp00ng9811cid7cdcs4a7a8hps"
    client.create_page "#{title}", "{{Study
  |StudyTitle=#{title}
  |ExecutedAtInstitution=#{institution}
  |Country=#{country}
  }}#{description}"
  end

end
