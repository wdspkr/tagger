import Vue from "vue/dist/vue.esm";
import TurbolinksAdapter from "vue-turbolinks";
import axios from "axios";
import Record from "./record.vue";
import FreeTag from "./free_tag.vue";

Vue.use(TurbolinksAdapter);

document.addEventListener("turbolinks:load", () => {
  const app = new Vue({
    el: "#explorer",
    data: {
      records: [],
      freeTags: [],
      filterTags: [],
    },

    created: function() {
      this.getRecords();
    },

    methods: {
      getRecords: function() {
        var vm = this;
        axios
          .get("search.json", {
            params: {
              free_tags: vm.filterTags,
            },
          })
          .then(function(response) {
            vm.records = response.data.records;
            vm.freeTags = response.data.free_tags;
          })
          .catch(function(error) {
            console.log(error);
          });
      },

      filterByFreeTag: function(term) {
        var pos = this.filterTags.indexOf(term);
        if (pos != -1) {
          this.filterTags.splice(pos, 1);
        } else {
          this.filterTags.push(term);
        }
        this.getRecords();
      },
    },

    components: {
      record: Record,
      "free-tag": FreeTag,
    },
  });
});
