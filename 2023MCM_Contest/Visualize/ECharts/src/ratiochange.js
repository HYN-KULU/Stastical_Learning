import * as echarts from 'echarts';
import {credit} from './dataset';

var chartDom = document.getElementById('main');
var myChart = echarts.init(chartDom);
var option;

option = {
  grid: {
    right: 120
  },
  xAxis: {
    name: 'Fuzzy Exponent',
    type: 'value',
    scale: true
  },
  yAxis: {
    name: 'Accuracy',
    type: 'value',
    // scale: true
    min: 0.55
  },
  series: [
    {
      data: credit,
      type: 'line'
    }
  ]
};

option && myChart.setOption(option);
