<template lang="html">
  <div>
    <div>
      <h2>Allocation Detail</h2>
      <div class="field">
        <label>Date</label>
        <select class="ui fluid dropdown" v-model="selecteDate">
          <option value="2018-04">2018-04</option>
          <option value="2018-03">2018-03</option>
          <option value="2018-02">2018-02</option>
          <option value="2018-01">2018-01</option>
        </select>
      </div>
      <table class="ui compact celled definition table" id="allocation-table">
        <thead>
          <tr>
            <th>Category</th>
            <th v-for="item in allocationlist" :key="item.name">
              {{item.name}}
            </th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <td>Total Score</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.total}}
            </td>
          </tr>
          <tr>
            <td>Performance</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.total_p}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;1Q</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.q1}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;3Q</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.q3}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;1Y</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.y1}}
            </td>
          </tr>
          <tr>
            <td>Stability</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.total_s}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;Survival</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.survival}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;RAPM</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.rapm}}
            </td>
          </tr>
          <tr>
            <td>Quality</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.total_q}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;Community</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.community}}
            </td>
          </tr>
          <tr>
            <td>&nbsp;&nbsp;IEF team</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.iefteam}}
            </td>
          </tr>
          <tr>
            <td>Last Month AUM</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.last_month_aum}}
            </td>
          </tr>
          <tr>
            <td>This Month Aum Allocation</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.last_month_aum_allo}}
            </td>
          </tr>
          <tr>
            <td>This Month AUM</td>
            <td v-for="item in allocationlist" :key="item.name">
              {{item.This_month_aum}}
            </td>
          </tr>
        </tbody>
      </table>
    </div>
    <div class="ui grid">
      <div class="eight wide column">
        <h2>Allocation History</h2>
        <div class="field">
          <label>Choose</label>
          <select class="ui fluid dropdown" v-model="selectAllocation">
            <option value="IEF Total">IEF Total</option>
            <option v-for="item in allocationlist" :value="item.name" :key="item.name">{{ item.name }}</option>
          </select>
        </div>
        <allocation-chart></allocation-chart>
      </div>
      <div class="eight wide column">
        <h2>Score History</h2>
        <div class="field">
          <label>Choose</label>
          <select class="ui fluid dropdown" v-model="selectScore">
            <option value="IEF Total">IEF Total</option>
            <option v-for="item in allocationlist" :value="item.name" :key="item.name">{{ item.name }}</option>
          </select>
          {{selectScore}}
        </div>
        <score-chart :select-score="selectScore"></score-chart>
      </div>
    </div>
  </div>
</template>

<script>
import Allocationlist from '../../assets/allocation.json'
import AllocationChart from './chart/AllocationChart.vue'
import ScoreChart from './chart/ScoreChart.vue'

export default {
  data: function () {
    return {
      allocationlist: Allocationlist,
      selecteDate: '2018-03',
      selectAllocation: 'IEF Total',
      selectScore: 'IEF Total'
    }
  },
  components: {
    AllocationChart,
    ScoreChart
  },
  beforeUpdate () {
    console.log('bup parent')
  }
}
</script>

<style lang="css">
</style>
