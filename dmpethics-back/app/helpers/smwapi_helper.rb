module SmwapiHelper
 
  def add_study(id="", title="", country="", institution="", description="", authors="", pid="", topics="", ethics="")
    client = MediawikiApi::Client.new "http://localhost/smw/api.php"
    client.log_in "Verena@editbot", "nq78aakp00ng9811cid7cdcs4a7a8hps"
    client.create_page "#{id}", "{{Study
  |StudyTitle=#{title}
  |PID=#{pid}
  |Authors=#{authors}
  |ExecutedAtInstitution=#{institution}
  |Country=#{country}
  |Keywords=#{topics}
  |EthicsFactors=#{ethics}
  }}#{description}"
  end

  def delete_study(id)
    client = MediawikiApi::Client.new "http://localhost/smw/api.php"
    client.log_in "Verena@editbot", "nq78aakp00ng9811cid7cdcs4a7a8hps"
    client.delete_page "#{id}", "Original author deleted study"
  end

  def getExistingData(id)
    client = MediawikiApi::Client.new "http://localhost/smw/api.php"
    client.log_in "Verena@editbot", "nq78aakp00ng9811cid7cdcs4a7a8hps"
    res = client.get_wikitext "#{id}"
    return res
  end

end
