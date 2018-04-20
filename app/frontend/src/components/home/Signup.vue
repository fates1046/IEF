<template lang="html">
  <div>
    <form class="ui large form">
      <div class="ui stacked segment">
        <h4 class="ui dividing header">Join now!</h4>
        <div class="field">
          <div class="two fields">
            <div class="field">
              <input type="text" placeholder="First Name">
            </div>
            <div class="field">
              <input type="text" placeholder="Last Name">
            </div>
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="email" placeholder="E-mail address">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="Password">
          </div>
        </div>
        <div class="field">
          <div class="ui left labeled input">
            <div class="ui dropdown label">
              <div class="text">+82</div>
              <i class="dropdown icon"></i>
              <div class="menu">
                <div class="item">+82</div>
              </div>
            </div>
            <input type="tel" name="phone" placeholder="Phone Number">
          </div>
        </div>
        <div class="inline fields">
          <label>As a</label>
          <div class="field">
            <div class="ui radio checkbox">
              <input type="radio" name="member" checked="checked">
              <label>Investor</label>
            </div>
          </div>
          <div class="field">
            <div class="ui radio checkbox">
              <input type="radio" name="member">
              <label>Manager</label>
            </div>
          </div>
        </div>
        <div class="field">
          <div class="ui checkbox">
            <label>I accept..</label>
            <input type="checkbox" tabindex="0">
          </div>
        </div>
        <div class="ui fluid large basic teal submit button">Sign Up</div>
      </div>
    </form>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="css">
</style>
