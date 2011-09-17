JCoordinate = com.vividsolutions.jts.geom.Coordinate
JGeometry = com.vividsolutions.jts.geom.Geometry
JPoint = com.vividsolutions.jts.geom.Point
WKTReader = com.vividsolutions.jts.io.WKTReader

module GeoScript
  module Geom
    def self.factory
      @@geometry_factory ||= com.vividsolutions.jts.geom.GeometryFactory.new
    end
    def self.wktReader
      @@wkt_reader ||= WKTReader.new(factory)
    end
    def self.fromWKT(wkt)
      wktReader.read(wkt)
    end
    module Factory
      def factory
        Geom.factory
      end
    end
    class Geometry < JGeometry
      include Factory
      def initialize(wkt)
        super(factory.read(wkt.to_s))
      end
    end
    class Point < JPoint
      include Factory
      def initialize(*args)
        if args.is_a? Hash
          c = JCoordinate.new(args[:x],args[:y])
          c.z = args[:z] if(args[:z])
        elsif args.respond_to? 'length'
#          if args.length == 1 && args[0].is_a? JPoint
#            p = args[0]
#          else
            c = JCoordinate.new(args[0],args[1])
            if args.length > 2
              c.z = args[2]
            end
#          end
        else
          raise "Invalid Point: #{args.inpsect}"
        end
        p = factory.create_point(c)
        super(p.coordinate_sequence, factory)
      end
    end
  end
end
