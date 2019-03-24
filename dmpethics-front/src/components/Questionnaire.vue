
<template>
  <div class="container">
    <div class="form-field">
        <label class="form-label">Study title</label>
        <input type="text" class="input" name="studytitle" v-model="studytitle">
    </div>

    <div class="form-field">
        <label class="form-label">Main institution for the study</label>
        <input type="text" class="input" name="institution" v-model="institution">
    </div>
        <div class="form-field">
        <label class="form-label">Study description</label><br>
        <textarea name="studydesc" v-model="studydesc"></textarea>
    </div>
    <h3>Study details</h3>
    <tree :question-data="questions"></tree>
    <button class="submitQuestionnaire" @click="saveAnswer">Submit</button>

</div>
</template>

<script>
import Tree from "./Tree";
import axios from "axios";
import router from "../router"

export default {
  name: "Questionnaire",
  data: () => ({ "studytitle": '',
  "questions":{
                "label": "root",
                "comment": "",
                "children": [
                {
                  "id": "A",
                  "checked": false,
                  "category": "A",
                  "label": "Are human participants involved?",
                  "comment": "Need informed consent",
                  "requirements": ["Consent form", "Patient information sheet"],
                  "children": [
                    {
                      "id": "A00001",
                      "checked": false,
                      "category": "A",
                      "label": "Are minors involved?",
                      "comment": "Need parental consent",
                      "requirements": [],
                      "children": [
                        {
                          "id": "A00003",
                          "checked": false,
                          "category": "A",
                          "label": "Are any involved minors wards of the state?",
                          "comment": "An advocate must be organized.",
                          "requirements": [],
                          "children": [

                          ]
                        }

                      ]
                    },
                    {
                      "id": "A00002",
                      "checked": false,
                      "category": "A",
                      "label": "Are pregnant women involved?",
                      "comment": "",
                      "requirements": [],
                      "children": [

                      ]
                    },
                    {
                      "id": "A00004",
                      "checked": false,
                      "category": "A",
                      "label": "Are prisoners involved?",
                      "comment": "Need informed consent",
                      "requirements": [],
                      "children": [

                      ]
                    },
                    {
                      "id": "A00005",
                      "checked": false,
                      "category": "A",
                      "label": "Are participants involved who aren't native speakers of your study's language?",
                      "comment": "Study details should be easy to understand.",
                      "requirements": [],
                      "children": [

                      ]
                    },
                    {
                      "id": "A00006",
                      "checked": false,
                      "category": "A",
                      "label": "Are any illiterate participants involved?",
                      "comment": "",
                      "requirements": [],
                      "children": [

                      ]
                    },
                   {
                     "id": "A00007",
                     "checked": false,
                     "category": "A",
                     "label": "Are psychologically vulnerable participants involved?",
                     "comment": "",
                     "requirements": [],
                     "children": [

                     ]
                   },
                 {
                   "id": "A00008",
                   "checked": false,
                   "category": "A",
                   "label": "Are any of the researchers a study subject themselves?",
                   "comment": "",
                   "requirements": [],
                   "children": [

                   ]
                 },
                   {
                     "id": "A00009",
                     "checked": false,
                     "category": "A",
                     "label": "Is there any risk of psychological or physical harm for participants?",
                     "comment": "",
                     "requirements": [],
                     "children": [

                     ]
                   },
                 {
                   "id": "A00010",
                   "checked": false,
                   "category": "A",
                   "label": "Are there any potential gatekeepers, such as schools or nursing homes?",
                   "comment": "Get permission from the gatekeepers.",
                   "requirements": [],
                   "children": [

                   ]
                 },
                   {
                     "id": "A00011",
                     "checked": false,
                     "category": "A",
                     "label": "Do participants have knowledge of observation and data collection?",
                     "comment": "",
                     "requirements": [],
                     "children": [

                     ]
                   }
                    ]
                },

                {
                  "id": "B",
                  "checked": false,
                  "category": "B",
                  "label": "Are animals involved?",
                  "comment": "",
                  "requirements": [],
                  "children": [
                      {
                        "id": "B00001",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals vertrebrates?",
                        "comment": "",
                        "requirements": [],
                        "children": [
                        ]
                      },
                      {
                        "id": "B00002",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals non-vertrebrates?",
                        "comment": "",
                        "requirements": [],
                        "children": [
                        ]
                      },
                      {
                        "id": "B00003",
                        "checked": false,
                        "category": "B",
                        "label": "Are the animals cephalopods?",
                        "comment": "",
                        "requirements": [],
                        "children": [
                        ]
                      }
                  ]
                },

              {
                "id": "D",
                "checked": false,
                "category": "D",
                "label": "Does your study involve the environment, fieldwork, or existing structures or monuments?",
                "comment": "",
                "requirements": [],
                "children": [
                      {
                        "id": "D00001",
                        "checked": false,
                        "category": "D",
                        "label": "Could there be potential risk for the environment?",
                        "comment": "Detail the potentical risks in your application.",
                        "requirements": [],
                        "children": [
                        ]
                      },
                    {
                      "id": "D00002",
                      "checked": false,
                      "category": "D",
                      "label": "Does your study involve work on existing monuments?",
                      "comment": "Get permission from the parties responsible for the monument.",
                      "requirements": [],
                      "children": [
                          {
                            "id": "D00004",
                            "checked": false,
                            "category": "D",
                            "label": "Is there any form of altering or potentially damaging a monument involved?",
                            "comment": "",
                            "requirements": [],
                            "children": [
                            ]
                          }
                      ]
                    },
                      {
                        "id": "D00003",
                        "checked": false,
                        "category": "D",
                        "label": "Will your study take place on private property?",
                        "comment": "Get permission and consent from the owner.",
                        "requirements": [],
                        "children": [
                        ]
                      },

                ]
              },
            {
              "id": "C",
              "checked": false,
              "category": "C",
              "label": "Check",
              "comment": "",
              "requirements": [],
              "children": [
              {
                "id": "C00001",
                "checked": false,
                "category": "C",
                "label": "Are you, the researcher, a student?",
                "comment": "The application form will require your supervisor's signature.",
                "requirements": [],
                "children": [
                ]
              },
              {
                "id": "C00002",
                "checked": false,
                "category": "C",
                "label": "Do you collect data outside the country where you will apply for ethics approval?",
                "comment": "Consult w.r.t. safety guidelines for travelling and fieldwork.",
                "requirements": [],
                "children": [
                ]
              },
              {
                "id": "C00003",
                "checked": false,
                "category": "C",
                "label": "Will the fieldwork in that country come with specific physical or psychological risks for involved researchers?",
                "comment": "",
                "requirements": [],
                "children": [
                ]
              },
              {
                "id": "C00004",
                "checked": false,
                "category": "C",
                "label": "Is your institution not the only institution involved in any way or form?",
                "comment": "Collect approval from all involved institutions.",
                "requirements": [],
                "children": [
                ]
              },
              {
                "id": "C00005",
                "checked": false,
                "category": "C",
                "label": "Could your study results be misused, for example for military purposes?",
                "comment": "",
                "requirements": [],
                "children": [
                ]
              },
              ]
            }



              ]
            }
        }),
    components: {
      Tree
    },
  methods: {
    saveAnswer(){
      Promise.all([axios.post('http://localhost:3000/answers', {answer: {study: this.studytitle, data: JSON.stringify(this.questions)}}),
                  axios.post('http://localhost:3000/study_details', {study_detail: {user_id: "1", study_id: this.studytitle, institution: this.institution, study_description: this.studydesc}})])
        .then(function () {
        router.replace('/answers');
           })
           
    }
  }
};
</script>