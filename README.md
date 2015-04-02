d3.scatter
==========

use svg circles to make a scatterplot

Example
-------

a [real life scatter plot](http://enucatl-presentations.github.io/2015.02.16.orlando.spie/#/12) with [source code](https://github.com/enucatl-presentations/2015.02.16.orlando.spie/blob/master/source/javascripts/_ratio_df_all.js.coffee#L18)


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
