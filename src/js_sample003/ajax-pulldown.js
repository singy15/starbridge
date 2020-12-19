import axios from "axios";

var ajaxPulldown = {
  props: ["source"],
  data: function () {
    return {
      opts: [],
    };
  },
  mounted: function () {
    axios.get(this.source).then((response) => (this.opts = response.data));
  },
  template: `
  <select>
    <option v-for="opt in opts" :value="opt.val">{{ opt.text }}</option>
  </select>
  `,
};

export { ajaxPulldown };


/* USAGE:

import Vue from "vue";
import { ajaxPulldown } from "./js-ajax-pulldown";

var app = new Vue({
  el: "#app",
  delimiters: ["[[", "]]"],
  components: {
    "ajax-pulldown": ajaxPulldown,
  },
  data: {
    featureId: featureId,
  },
  methods: {},
});


<ajax-pulldown source="/pulldown/weekday"></ajax-pulldown>

*/
