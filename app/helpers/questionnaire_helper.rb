module QuestionnaireHelper

  # Reads question data from RDF Turtle format into a Hashmap
  # TODO relative path
  def readrdf

    rdfarray = Array.new
    rdfmap = Hash.new

    RDF::Turtle::Reader.open('questions1.ttl') do |reader|

      reader.each_triple do |subject, predicate, object|
        rdfarray.push([subject.to_s, [predicate.to_s, object.to_s]])
      end
    end

    for x in rdfarray
      id = x[0]
      rdfmap[id] = []
    end

    for x in rdfarray
      id = x[0]
      rdfmap[id] << x[1][1]
    end

    return rdfmap
  end

  def readrdfasarray

    rdfarray = Array.new

    RDF::Turtle::Reader.open('questions1.ttl') do |reader|

      reader.each_triple do |subject, predicate, object|
        rdfarray.push([subject.to_s, [predicate.to_s, object.to_s]])
      end
    end

    return rdfarray
  end
end
