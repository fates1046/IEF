<template lang="html">
  <div>
    <h1>Voting Season</h1>
    <p>2018.04.20 ~ 2018.04.26</p>
    <div class="ui grid">
      <div class="eight wide column">
        <h2>Best Manager</h2>
        <div class="ui success message">
          <div class="header">Voting Best Manager</div>
          <p v-show="!isVoted">Please vote...</p>
          <p v-show="isVoted">Already vote</p>
          <div class="field" v-show="!isVoted">
            <select class="ui fluid dropdown" v-model="selectBest">
              <option v-for="item in managers" :value="item" :key="item">{{ item }}</option>
            </select>
          </div>
        </div>
      </div>
      <div class="eight wide column">
        <h2>Worst Manager</h2>
        <div class="ui error message">
          <div class="header">Voting Worst Manager</div>
          <p v-show="!isVoted">Please vote...</p>
          <p v-show="isVoted">Already vote</p>
          <div class="field" v-show="!isVoted">
            <select class="ui fluid dropdown" v-model="selectWorst">
              <option v-for="item in managers" :value="item" :key="item">{{ item }}</option>
            </select>
          </div>
        </div>
      </div>
    </div>
    <div id="voteBtn">
      <button class="ui fluid teal basic button" v-show="!isVoted" @click="voteClicked">Vote</button>
    </div>
    <div>
      <h2>Vote History</h2>
      <table class="ui compact celled structured table" id="vote-history-table">
        <thead>
          <tr>
            <th>Date</th>
            <th>Best</th>
            <th>Worst</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="item in voteHistory" :key="item.name">
            <td>{{item.date}}</td>
            <td>{{item.best}}</td>
            <td>{{item.worst}}</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import Vote from '../../assets/vote.json'

export default {
  data: function () {
    return {
      managers: ['mgr1', 'mgr2', 'mgr3', 'mgr4', 'mgr5', 'mgr6', 'mgr7', 'mgr8', 'mgr9', 'mgr10'],
      selectBest: 'mgr1',
      selectWorst: 'mgr1',
      voteHistory: Vote,
      isVoted: false
    }
  },
  methods: {
    voteClicked: function () {
      alert(`best: ${this.selectBest}, worst: ${this.selectWorst}`)
      this.isVoted = true
    }
  }
}
</script>

<style lang="css">
#voteBtn {
  margin-top: 10px;
  margin-bottom: 10px;
}
</style>
