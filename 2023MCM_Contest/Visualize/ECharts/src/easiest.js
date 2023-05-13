import * as echarts from 'echarts';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

option = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    legend: {
        top: 10,
        right: '52%'
    },
    grid: {
        left: '3%',
        right: '50%',
        bottom: '50%',
        containLabel: true
    },
    xAxis: {
        type: 'value',
        boundaryGap: [0, 0.01]
    },
    yAxis: {
        type: 'category',
        data: ['raise',
            'alert',
            'store',
            'learn',
            'about'
        ],
    },
    series: [
        {
            name: 'Difficulty Mean',
            type: 'bar',
            data: [3.23718500137329,
                3.20922994613647,
                3.16358327865601,
                3.077223777771,
                2.50895547866821
            ]
        },
        {
            name: 'Variance',
            type: 'bar',
            data: [0.957085311412811,
                1.26682555675507,
                0.807986080646515,
                0.721697747707367,
                0.672640025615692
            ]
        }
    ]
};

option && myChart.setOption(option);
