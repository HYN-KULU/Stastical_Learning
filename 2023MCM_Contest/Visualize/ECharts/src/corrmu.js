import * as echarts from 'echarts';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

const labelRight = {
    position: 'right'
};
const labelLeft = {
    position: 'left'
};
option = {
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        }
    },
    grid: {
        top: 80,
        bottom: 300,
        right: 200
    },
    xAxis: {
        type: 'value',
        position: 'top',
        splitLine: {
            lineStyle: {
                type: 'dashed'
            }
        },
        // min: -0.6,
        max: 1
    },
    yAxis: {
        type: 'category',
        axisLine: { show: false },
        axisLabel: { show: false },
        axisTick: { show: false },
        splitLine: { show: false },
        data: [
            'Difficulty Mean',
            'Entropy',
            'Frequency',
            'Repitition',
            'Vowel'
        ]
    },
    series: [
        {
            name: 'Corr',
            type: 'bar',
            stack: 'Total',
            label: {
                show: true,
                formatter: '{b}'
            },
            data: [
                {
                    value: 1, label: labelLeft, itemStyle: {
                        color: '#a90000'
                    }
                },
                {
                    value: -0.553623550601132, label: labelRight, itemStyle: {
                        color: 'green'
                    }
                },
                {
                    value:-0.161428370341952, label: labelRight,
                    itemStyle: {
                        color: 'green'
                    }
                },
                {
                    value: 0.400476017320109, label: labelLeft,
                    itemStyle: {
                        color: '#a90000'
                    }
                },
                {
                    value: -0.0769905805503125, label: labelRight,
                    itemStyle: {
                        color: 'green'
                    }
                }
            ]
        }
    ]
};

option && myChart.setOption(option);
