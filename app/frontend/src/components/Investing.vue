<template lang="html">
  <div class="ui">
    <div>
      <div class="ui left fixed vertical menu" id="side-bar">
        <div class="item">
          <div class="header">Information</div>
          <div class="menu" @click="activeClicked">
            <router-link to="/investing/performance" class="item" :class="{'active': isClicked('Performance')}">Performance</router-link>
            <router-link to="/investing/portfolio" class="item" :class="{'active': isClicked('Portfolio')}">Portfolio</router-link>
            <router-link to="/investing/allocation" class="item" :class="{'active': isClicked('Allocation')}">Allocation</router-link>
            <router-link to="/investing/community" class="item" :class="{'active': isClicked('Community')}">Community</router-link>
          </div>
        </div>
        <div class="item">
          <div class="header">Manager</div>
          <div class="menu"  @click="activeClicked">
            <router-link to="/investing/trading" class="item" :class="{'active': isClicked('Trading')}">Trading</router-link>
          </div>
        </div>
        <div class="item">
          <div class="header">Voting</div>
          <div class="menu"  @click="activeClicked">
            <router-link to="/investing/voting" class="item" :class="{'active': isClicked('Voting')}">Voting</router-link>
          </div>
        </div>
        <div class="item">
          <div class="header">Setting</div>
          <div class="menu"  @click="activeClicked">
            <router-link to="/investing/setting" class="item" :class="{'active': isClicked('setting')}">setting</router-link>
            <router-link to="/investing/governance" class="item" :class="{'active': isClicked('governance')}">governance</router-link>
          </div>
        </div>
      </div>
    </div>
    <div id="info-content">
      <router-view/>
    </div>
  </div>
</template>

<script>
export default {
  data: () => {
    return {
      checked: 'Performance'
    }
  },
  methods: {
    activeClicked: function (event) {
      this.checked = event.target.innerHTML
      window.scrollTo(0, 0)
    },
    isClicked: function (str) {
      return this.checked === str
    }
  }
}
</script>

<style lang="css">
#side-bar {
  margin-top: 62px;
  margin-bottom: 150px;
}
#info-content {
  margin-left: 225px;
  margin-right:20px;
  margin-top: 20px;
}
.active {
  font-weight: bold;
  color: gray !important;
}
</style>
