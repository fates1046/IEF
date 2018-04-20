<script>
import { Bar } from 'vue-chartjs'
export default({
  extends: Bar,
  props: ['selectScore'],
  data: function () {
    return {
      datacollection: {
        labels: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12'],
        datasets: [
          {
            label: this.selectScore,
            pointBackgroundColor: 'white',
            fill: false,
            borderWidth: 1,
            pointBorderColor: '#249EBF',
            data: [10, 50, 20, 60, 30, 50, 10, 20, 50, 70, 50, 70]
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
        maintainAspectRatio: false
      }
    }
  },
  mounted () {
    this.renderChart(this.datacollection, this.options)
  }
})
</script>
