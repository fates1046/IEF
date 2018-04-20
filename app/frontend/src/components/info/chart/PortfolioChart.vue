<script>
import { Line } from 'vue-chartjs'
export default({
  extends: Line,
  data: function () {
    return {
      datacollection: {
        labels: ['', '', '', '', '', '', '', '', '', ''],
        datasets: [
          {
            pointBackgroundColor: 'white',
            fill: false,
            borderWidth: 1,
            pointBorderColor: '#249EBF',
            data: [40, 20, 30, 50, 90, 10, 20, 40, 50, 70, 90, 100]
          },
          {
            label: 'Data Two',
            pointBackgroundColor: 'white',
            fill: false,
            borderWidth: 1,
            pointBorderColor: '#249EBF',
            data: [12, 32, 42, 55, 12, 77, 46, 34, 74, 23, 90, 100]
          }
        ]
      },
      options: {
        scales: {
          yAxes: [{
            ticks: {
              beginAtZero: true
            },
            gridLines: {
              display: true
            }
          }],
          xAxes: [{
            gridLines: {
              display: false
            }
          }]
        },
        legend: {
          display: true
        },
        responsive: true,
        maintainAspectRatio: false,
        elements: {
          line: {
            tension: 0.1
          }
        },
        animation: {
          easing: 'linear'
        }
      }
    }
  },
  mounted () {
    this.renderChart(this.datacollection, this.options)
  }
})
</script>
