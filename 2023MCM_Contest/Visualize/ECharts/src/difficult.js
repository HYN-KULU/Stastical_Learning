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
    data: ['emcee', 'mamma', 'geese', 'melee', 'tepee',].reverse()
  },
  series: [
    {
      name: 'Difficulty Mean',
      type: 'bar',
      data: [5.75563383102417,
        5.58798027038574,
        5.57260704040527,
        5.55771350860596,
        5.52671670913696
      ].reverse()
    },
    {
      name: 'Variance',
      type: 'bar',
      data: [1.05853497982025,
        1.321573138237,
        1.14620101451874,
        1.14974272251129,
        1.15505266189575,
      ].reverse()
    }
  ]
};

option && myChart.setOption(option);
