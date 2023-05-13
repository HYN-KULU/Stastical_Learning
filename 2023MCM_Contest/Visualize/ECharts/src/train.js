import * as echarts from 'echarts';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

option = {
  title: {
    text: ''
  },
  legend: {
    data: ['Testing Set Loss', 'Training Set Loss']
  },
  grid: {
    left: '3%',
    right: '9%',
    bottom: '43%',
    containLabel: true
  },
  xAxis: {
    type: 'category',
    boundaryGap: false,
    data: ['Train 1', 'Train 2', 'Train 3','Train 4','Train 5','Train 6']
  },
  yAxis: {
    type: 'value'
  },
  series: [
    {
      name: 'Testing Set Loss',
      type: 'line',
      // stack: 'Total',
      data: [0.1134, 0.105, 0.13, 0.11,0.11, 0.143]
    },
    {
      name: 'Training Set Loss',
      type: 'line',
      // stack: 'Total',
      data: [0.1034, 0.095, 0.089, 0.092,0.096, 0.071]
    }
  ]
};

option && myChart.setOption(option);
