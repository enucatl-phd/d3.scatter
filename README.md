d3.scatter
==========

use svg circles to make a scatterplot

Example
-------

```coffeescript
plot = new d3.chart.Scatter()
    .width width
    .height height
    .margin margin
    .x_value (d) -> new Date d.time
    .y_value (d) -> d.value

d3.json "data.json", (error, data) ->
    if error?
        console.warn error
        return
    
    d3.select "#plot"
        .datum data
        .call plot.draw
```

Depends on
----------

my [base chart component](https://github.com/Enucatl/d3.base.chart)
