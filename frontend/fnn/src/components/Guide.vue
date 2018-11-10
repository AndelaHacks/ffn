<template>
    <div class="page-header">
      <div class="page-header-image"></div>
      <div class="content">
        <div class="container">
            <div class="section section-tabs">
                <div class="container">
                  <div class="title">
                    <h3 class="mb-3">Info Guide</h3>
                  </div>
                  <div class="row">
                    <div class="col-md-10 ml-auto col-xl-6 mr-auto">
                      <div class="mb-3">
                        <small class="text-uppercase font-weight-bold">For non-users</small>
                      </div>
                      <!-- Nav tabs -->
                      <div class="card">
                        <div class="card-header">
                          <ul class="nav nav-tabs nav-tabs-primary" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" data-toggle="tab" href="#link1" role="tablist">
                                <i class="tim-icons icon-spaceship"></i> Step 1
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#link2" role="tablist">
                                <i class="tim-icons icon-settings-gear-63"></i> Step 2
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#link3" role="tablist">
                                <i class="tim-icons icon-bag-16"></i> Step 3
                              </a>
                            </li>
                          </ul>
                        </div>
                        <div class="card-body">
                          <!-- Tab panes -->
                          <div class="tab-content tab-space">
                            <div class="tab-pane active" id="link1">
                              <p> Input content on the input box; link, text or file media
                                <br />
                                <br/> Dramatically visualize customer directed convergence without revolutionary ROI.</p>
                            </div>
                            <div class="tab-pane" id="link2">
                              <p>Click on the verify button
                                <br />
                                <br/>Dynamically innovate resource-leveling customer service for state of the art customer service.</p>
                            </div>
                            <div class="tab-pane" id="link3">
                              <p>Views results rating and badge percentage
                                <br />
                                <br/> Dramatically maintain clicks-and-mortar solutions without functional solutions.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col-md-10 ml-auto col-xl-6 mr-auto">
                      <div class="mb-3">
                        <small class="text-uppercase font-weight-bold">For users</small>
                      </div>
                      <!-- Tabs with Background on Card -->
                      <div class="card">
                        <div class="card-header">
                          <ul class="nav nav-tabs nav-tabs-primary" role="tablist">
                            <li class="nav-item">
                              <a class="nav-link active" data-toggle="tab" href="#link4" role="tablist">
                                <i class="tim-icons icon-spaceship"></i> Step 1
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#link5" role="tablist">
                                <i class="tim-icons icon-settings-gear-63"></i> Step 2
                              </a>
                            </li>
                            <li class="nav-item">
                              <a class="nav-link" data-toggle="tab" href="#link6" role="tablist">
                                <i class="tim-icons icon-bag-16"></i> Step 3
                              </a>
                            </li>
                          </ul>
                        </div>
                        <div class="card-body">
                          <!-- Tab panes -->
                          <div class="tab-content tab-space">
                            <div class="tab-pane active" id="link4">
                              <p>  Input context on input box and click on the verify button
                                <br/>But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures</p>
                            </div>
                            <div class="tab-pane" id="link5">
                              <p> Views the results rating</p>
                            </div>
                            <div class="tab-pane" id="link6">
                              <p>Sign up or log in to view, add comments and vote on the topic of choice.</p>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- End Tabs on plain Card -->
                    </div>
                  </div>
                </div>
            </div>
            <!-- End Section Tabs -->
            <button class="btn btn-primary btn-round" type="button">
                <i class="tim-icons icon-heart-2"></i> Go to Dashboard
            </button>
        </div>
      </div>
    </div>
</template>

<script>
export default {
  name: 'Guide',
  data () {
    return {
      ffnis: [],
      error: ''
    }
  },
  created () {
    this.$http.axios.get('/users')
      .then(response => { this.ffnis = response.data })
      .catch(error => this.setError(error, 'Something went wrong'))
  }
}
</script>

<style lang="css">
</style>
