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
        }
    },
    yAxis: {
        type: 'category',
        axisLine: { show: false },
        axisLabel: { show: false },
        axisTick: { show: false },
        splitLine: { show: false },
        data: [
            'Ratio',
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
                    value: 1, label: labelLeft,
                    itemStyle: {
                        color: '#a90000'
                    }
                },
                {
                    value: -0.101043623772642, label: labelRight, itemStyle: {
                        color: 'green'
                    }
                },
                {
                    value: -0.115729989603144, label: labelRight,
                    itemStyle: {
                        color: 'green'
                    }
                },
                {
                    value: 0.0869112143870144, label: labelLeft,
                    itemStyle: {
                        color: '#a90000'
                    }
                },
                {
                    value: 0.0808025679945533, label: labelLeft,
                    itemStyle: {
                        color: '#a90000'
                    }
                }
            ]
        }
    ]
};

option && myChart.setOption(option);
