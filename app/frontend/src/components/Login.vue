<template lang="html">
  <div id="login">
    <div class="ui middle aligned center aligned grid">
      <div class="column">
        <h2 class="ui image header">
          <div class="content">
            Login Page
          </div>
        </h2>
        <form class="ui large form">
          <div class="ui stacked segment">
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
            <div class="inline fields">
              <div class="field">
                <div class="ui checkbox">
                  <label>Stay signed in</label>
                  <input type="checkbox" tabindex="0">
                </div>
              </div>
            </div>
            <div class="ui fluid large basic teal submit button">Login</div>
            <div class="ui grid">
                <div class="right floated column" id="right"><a>Sign up now!</a></div>
            </div>
          </div>
          <div class="ui error message"></div>
        </form>
      </div>
    </div>
  </div>
</template>

<script>
export default {
}
</script>

<style lang="css">
#login {
  padding-top: 100px;
}
#right {
  text-align: right;
}
.column {
  max-width: 450px;
}
</style>
