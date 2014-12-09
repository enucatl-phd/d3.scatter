class d3.chart.Scatter extends d3.chart.BaseChart

    constructor: ->
        @accessors = {} unless @accessors?
        @accessors.radius = 3
        @accessors.x_value = (d) -> d.x
        @accessors.y_value = (d) -> d.y
        @accessors.color_value = (d) -> d.name
        @accessors.color_scale = d3.scale.category20()
        super

    _draw: (element, data, i) ->
                 
        # convenience accessors
        width = @width()
        height = @height()
        margin = @margin()
        radius = @radius()
        x_value = @x_value()
        y_value = @y_value()
        x_scale = @x_scale()
        y_scale = @y_scale()
        color_value = @color_value()
        color_scale = @color_scale()

        # get unique color names
        color_names = (data.map color_value).filter (d, i, self) ->
            self.indexOf d == i

        color_scale.domain color_names

        # update scales
        x_scale.range [0, width]
        y_scale.range [height, 0]

        # select the svg if it exists
        svg = d3.select this
            .selectAll "svg"
            .data [data]

        # otherwise create the skeletal chart
        g_enter = svg.enter()
            .append "svg"
            .append "g"

        # update the dimensions
        svg
            .attr "width", width + margin.left + margin.right
            .attr "height", height + margin.top + margin.bottom

        # update position
        g = svg.select "g"
            .attr "transform", "translate(#{margin.left}, #{margin.top})"

        g
            .selectAll ".circles"
            .data [data]
            .enter()
            .append "g"
            .classed "circles", true

        # update circles
        circles = g.select ".circles"
            .selectAll ".circle"
            .data (d) -> d

        circles
            .enter()
            .append "circle"
            .classed "circle", true

        circles
            .attr "r", radius
            .attr "cx", (d) -> x_scale x_value d
            .attr "cy", (d) -> y_scale y_value d
            .style "fill", (d) -> color_scale color_value d

        circles
            .exit()
            .remove()
