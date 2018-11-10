<template>
  <div class="page-header">
      <div class="page-header-image"></div>
      <div class="content">
        <div class="container">
          <div class="row">
            <div class="col-lg-12 col-md-12">
              <form class="form-signup" @submit.prevent="signup">
                <div class="alert alert-danger" v-if="error">{{ error }}</div>
                  <div id="square7" class="square square-7"></div>
                  <div id="square8" class="square square-8"></div>
                  <div class="card card-register">
                    <div class="card-header">
                      <h4 class="card-title" style="color: #ffffff">Register</h4>
                    </div>
                    <div class="card-body">
                      <form class="form">
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="tim-icons icon-single-02"></i>
                            </div>
                          </div>
                          <input v-model="name" type="text" class="form-control" placeholder="Full Name">
                        </div>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="tim-icons icon-email-85"></i>
                            </div>
                          </div>
                          <input v-model="email" type="text" placeholder="Email" class="form-control">
                        </div>
                        <div class="input-group">
                          <div class="input-group-prepend">
                            <div class="input-group-text">
                              <i class="tim-icons icon-lock-circle"></i>
                            </div>
                          </div>
                          <input v-model="password" type="text" class="form-control" placeholder="Password">
                        </div>
                        <div class="form-check text-left">
                          <router-link to="/login">Have an account? Go to login.</router-link>
                        </div>
                  </form>
                </div>
                <div class="card-footer">
                  <button type="submit" class="btn btn-info btn-round btn-lg">Register</button>
                </div>
              </div>
            </form>
            </div>
          </div>
          <div class="register-bg"></div>
          <div id="square1" class="square square-1"></div>
          <div id="square2" class="square square-2"></div>
          <div id="square3" class="square square-3"></div>
          <div id="square4" class="square square-4"></div>
          <div id="square5" class="square square-5"></div>
          <div id="square6" class="square square-6"></div>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Register',
  data () {
    return {
      email: '',
      password: '',
      name: '',
      error: ''
    }
  },
  created () {
    this.checkSignedIn()
  },
  updated () {
    this.checkSignedIn()
  },
  methods: {
    signup () {
      this.$http.axios.post('/users', { email: this.email, password: this.password, name: this.name })
        .then(response => this.signupSuccessful(response))
        .catch(error => this.signupFailed(error))
    },
    signupSuccessful (response) {
      localStorage.user = response.data.user
      localStorage.signedIn = true
      this.error = ''
      this.$router.replace('/')
    },
    signupFailed (error) {
      this.error = (error.response && error.response.data && error.response.data.error) || 'Something went wrong'
      delete localStorage.csrf
      delete localStorage.signedIn
    },
    checkSignedIn () {
      if (localStorage.signedIn) {
        this.$router.replace('/')
      }
    }
  }
}
</script>

<style lang="css">
</style>
