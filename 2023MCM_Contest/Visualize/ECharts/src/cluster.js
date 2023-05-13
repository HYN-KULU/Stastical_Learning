import * as echarts from 'echarts';

import { level1, level2, level3, level4, eerie, center } from './dataset.js';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

var circle_size = 8

option = {
    title: {
        text: 'Clusters of Difficulty'
    },
    xAxis: {
        name: 'Standardized Trial Mean'
    },
    yAxis: {
        name: 'Standardized Difficulty Score'
    },
    legend: {
        data: [
            'Easy',
            'Medium',
            'Hard',
            'Hell',
            'Eerie',
            'Centers'
        ],
        orient: 'vertical',
        left: 10,
        top: 200
    },
    grid: {
        left: 140,
        right: 270
    },
    series: [
        {
            name: 'Easy',
            type: 'scatter',
            symbolSize: circle_size,
            data: level1,
            color: [
                '#00ff13'
            ]
        },
        {
            name: 'Medium',
            type: 'scatter',
            symbolSize: circle_size,
            data: level2,
            color: [
                'orange'
            ]
        },
        {
            name: 'Hard',
            type: 'scatter',
            symbolSize: circle_size,
            data: level3,
            color: [
                '#ff0000'
            ]
        }
        ,
        {
            name: 'Hell',
            type: 'scatter',
            symbolSize: circle_size,
            data: level4,
            color: [
                '#b900b9'
            ]
        },
        {
            name: 'Eerie',
            type: 'scatter',
            symbolSize: 15,
            data: eerie,
            color: [
                'lightblue'
            ],
            itemStyle: {
                borderColor: 'black'
            }
        }, {
            name: 'Centers',
            type: 'scatter',
            symbolSize: 5,
            data: center,
            color: [
                'white'
            ],
            itemStyle: {
                borderColor: 'black'
            },
        }
    ]
};

option && myChart.setOption(option);
