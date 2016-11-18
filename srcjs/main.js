var d3 = require('d3');
var djs = require('dom.js');
console.log(djs);

// find the container element using selector expression.
var container = djs('.container');

// create an h1 element and append into container.
container.create('<h1>Hello World</h1>');

/*
var chartWidth = 500, chartHeight = 500;

var arc = d3.arc()
    .outerRadius(chartWidth/2 - 10)
    .innerRadius(0);

var colours = ['#F00','#000','#000','#000','#000','#000','#000','#000','#000'];

window.d3 = d3.select(document); //get d3 into the dom

//do yr normal d3 stuff
var svg = window.d3.select('body')
	.append('div').attr('class','container') //make a container div to ease the saving process
	.append('svg')
		.attr({
				xmlns:'http://www.w3.org/2000/svg',
				width:chartWidth,
				height:chartHeight
			})
	.append('g')
		.attr('transform','translate(' + chartWidth/2 + ',' + chartWidth/2 + ')');

svg.selectAll('.arc')
	.data( d3.layout.pie()(pieData) )
		.enter()
	.append('path')
		.attr({
			'class':'arc',
			'd':arc,
			'fill':function(d,i){
				return colours[i];
			},
			'stroke':'#fff'
		});

console.log(window.d3.select('.container').html());
*/
