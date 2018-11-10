<template>
  <div>
    <div v-if="error">{{ error }}</div>
    <div class="page-header">
      <div class="page-header-image"></div>
      <div class="content">
        <div class="container">
            <div class="col-md-10 ml-auto col-xl-10 mr-auto">
                <div class="card" style="margin-top: 10px;">
                  <div class="card-header">
                    Verify
                  </div>
                  <div class="card-body"  style="display: grid; grid-template-columns: 80% 20%; grid-template-rows: auto; grid-template-areas: 'content percent';">
                        <div style="grid-area: content">
                            <input v-model="topic" type="text" class="form-control" placeholder="Topic">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="tim-icons icon-lock-circle"></i></span>
                            </div>
                        </div>
                        <br>
                        <div style="grid-area: percent" class="input-group">
                            <input v-model="content" type="text" class="form-control" placeholder="Content">
                            <div class="input-group-append">
                                <span class="input-group-text"><i class="tim-icons icon-lock-circle"></i></span>
                            </div>
                        </div>
                        <button @click="postffni()" class="btn btn-primary">Verify</button>
                  </div>
                </div>

                <u style="margin-below: 15px;"># Top search</u>
                <div v-for="ffni in ffnis" :key="ffni.id" :ffni="ffni">
                    <div class="card">
                        <div class="card-header">
                            {{ ffni.topic }}
                        </div>
                        <div class="card-body"  style="display: grid; grid-template-columns: 80% 20%; grid-template-rows: auto; grid-template-areas: 'content percent';">
                          <div style="grid-area: content">
                                {{ ffni.content }}
                            </div>
                            <div class="nav nav-pills nav-pills-primary nav-pills-icons">
                                <li class="nav-item">
                                    <a class="nav-link active show" data-toggle="tab" href="#">
                                    <i class="tim-icons icon-atom"></i> {{ ((Number(ffni.upvotes)/(Number(ffni.downvotes)+Number(ffni.upvotes)))*100).toFixed(2) }}%
                                    </a>
                                </li>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Ffnis',
  data () {
    return {
      ffnis: [],
      topic: '',
      content: '',
      error: ''
    }
  },
  created () {
    this.$http.axios.get('/ffnis')
      .then(response => { this.ffnis = response.data })
      .catch(error => this.setError(error, 'Something went wrong'))
  },
  methods: {
    postffni () {
      this.$http.axios.post('/ffnis', { topic: this.topic, content: this.content, badge: 0, upvotes: 0, downvotes: 0, approval: 0, user_id: 1 })
        .then(response => {
          localStorage.ffni = JSON.stringify(response.data)
          this.$router.replace('/ffni')
        })
    }
  }
}
</script>

<style lang="css">
</style>
