# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120421151915) do

  create_table "accountlineitem", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "clientid"
    t.date     "itemdate"
    t.datetime "created"
    t.integer  "createdby"
    t.integer  "descriptionid"
    t.string   "comment",       :limit => 128
    t.decimal  "amount",                       :precision => 16, :scale => 2
    t.decimal  "balance",                      :precision => 16, :scale => 2
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "islastbalance", :limit => 2
    t.integer  "contractid"
  end

  create_table "accountpendinglineitem", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "clientid"
    t.date     "itemdate"
    t.datetime "created"
    t.integer  "createdby"
    t.integer  "descriptionid"
    t.string   "comment",        :limit => 128
    t.date     "pendingduedate"
    t.decimal  "amount",                        :precision => 16, :scale => 2
    t.decimal  "balance",                       :precision => 16, :scale => 2
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "islastbalance",  :limit => 2
    t.integer  "contractid"
  end

  create_table "addresslu", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "address",    :limit => 256
    t.string  "city",       :limit => 30
    t.string  "state",      :limit => 2
    t.string  "zip",        :limit => 15
    t.string  "phone",      :limit => 16
    t.string  "fax",        :limit => 16
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
    t.string  "address2",   :limit => 256
  end

  create_table "appgroup", :id => false, :force => true do |t|
    t.integer  "appgroupid",                 :null => false
    t.string   "appgroupname", :limit => 30
    t.integer  "statusid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.string   "role",         :limit => 32
    t.integer  "hide"
  end

  create_table "appt", :id => false, :force => true do |t|
    t.integer  "patientid"
    t.integer  "id",                                    :null => false
    t.datetime "starttime"
    t.integer  "showstatustypeid"
    t.integer  "appttypeid"
    t.integer  "physicianid"
    t.datetime "endtime"
    t.text     "note"
    t.integer  "confirmstatustypeid"
    t.integer  "waitinglist",              :limit => 2
    t.integer  "waitinglistsamephysician", :limit => 2
  end

  add_index "appt", ["physicianid", "starttime", "endtime"], :name => "appt_idx"

  create_table "apptshowstat", :id => false, :force => true do |t|
    t.text    "name"
    t.text    "abbrname"
    t.integer "id",       :null => false
  end

  create_table "apptstat", :id => false, :force => true do |t|
    t.text    "name"
    t.text    "abbrname"
    t.integer "id",       :null => false
  end

  create_table "appttodo", :id => false, :force => true do |t|
    t.datetime "datedue"
    t.datetime "datecomplete"
    t.text     "note"
    t.integer  "apptid"
    t.integer  "id",              :null => false
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "assignedto"
    t.integer  "assignedtogroup"
  end

  create_table "appttodolu", :id => false, :force => true do |t|
    t.integer "id",        :null => false
    t.text    "shortdesc"
    t.text    "longdesc"
  end

  create_table "appttype", :id => false, :force => true do |t|
    t.text    "name"
    t.integer "id",                            :null => false
    t.integer "exclusive",        :limit => 2
    t.integer "displaydob",       :limit => 2
    t.text    "color"
    t.integer "displaypcp",       :limit => 2
    t.integer "duration"
    t.integer "displaypcpphone",  :limit => 2
    t.text    "pattype"
    t.integer "displayhomephone", :limit => 2
    t.integer "displayname",      :limit => 2
    t.integer "displayreason",    :limit => 2
    t.integer "displaypriins",    :limit => 2
  end

  create_table "appuser", :id => false, :force => true do |t|
    t.integer  "appuserid",                :null => false
    t.string   "username",   :limit => 30
    t.string   "password",   :limit => 30
    t.integer  "statusid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "appusercontact", :id => false, :force => true do |t|
    t.integer  "appusercontactid",               :null => false
    t.integer  "appuserid"
    t.string   "nick",             :limit => 30
    t.string   "prefix",           :limit => 30
    t.string   "first",            :limit => 30
    t.string   "middle",           :limit => 30
    t.string   "last",             :limit => 30
    t.string   "suffix",           :limit => 30
    t.string   "address1",         :limit => 50
    t.string   "address2",         :limit => 50
    t.string   "city",             :limit => 30
    t.string   "state",            :limit => 30
    t.string   "zip",              :limit => 10
    t.string   "email"
    t.string   "primarycontact",   :limit => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "appusercontactphone", :id => false, :force => true do |t|
    t.integer  "appusercontactphoneid",               :null => false
    t.integer  "appusercontactid"
    t.integer  "phonetypeid"
    t.string   "phonenumber",           :limit => 20
    t.string   "primaryphone",          :limit => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "appusergroup", :id => false, :force => true do |t|
    t.integer  "appusergroupid", :null => false
    t.integer  "appuserid"
    t.integer  "appgroupid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "appuserlu", :id => false, :force => true do |t|
    t.integer  "appuserluid",                   :null => false
    t.string   "lookupcategory", :limit => 127
    t.string   "lookupvalue",    :limit => 127
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "archivelineitem", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "clientid"
    t.date     "itemdate"
    t.datetime "created"
    t.integer  "createdby"
    t.integer  "descriptionid"
    t.string   "comment",       :limit => 128
    t.decimal  "amount",                       :precision => 16, :scale => 2
    t.decimal  "balance",                      :precision => 16, :scale => 2
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "contractid"
  end

  create_table "aud_cc", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "audiogramid"
    t.string   "cc",          :limit => 128
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "aud_gram", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "physid"
    t.integer  "clientid"
    t.string   "patname",         :limit => 96
    t.string   "patdob",          :limit => 32
    t.string   "audiologist",     :limit => 64
    t.string   "visitdate",       :limit => 32
    t.string   "testtype_r",      :limit => 64
    t.string   "testtype_l",      :limit => 64
    t.string   "loss_r",          :limit => 64
    t.string   "loss_l",          :limit => 64
    t.string   "losstype_r",      :limit => 64
    t.string   "losstype_l",      :limit => 64
    t.string   "discrimscore_r",  :limit => 32
    t.string   "discrimscore_l",  :limit => 32
    t.string   "presentlevel_r",  :limit => 32
    t.string   "presentlevel_l",  :limit => 32
    t.string   "impedance_r",     :limit => 64
    t.string   "impedance_l",     :limit => 64
    t.text     "impedancenote_l"
    t.text     "impedancenote_r"
    t.string   "pbrollover_l",    :limit => 64
    t.string   "pbrollover_r",    :limit => 64
    t.integer  "hasmtid_l"
    t.integer  "hasmtid_r"
    t.text     "rectext"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.text     "reflex_l"
    t.text     "reflex_r"
    t.text     "rectext2"
    t.text     "followuptext"
    t.text     "retesttext"
    t.text     "referraltext"
    t.text     "notes"
    t.text     "comments"
  end

  create_table "aud_gram_tmp", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "physid"
    t.integer  "clientid"
    t.string   "notes",           :limit => 256
    t.string   "comments",        :limit => 256
    t.string   "patname",         :limit => 96
    t.string   "patdob",          :limit => 32
    t.string   "audiologist",     :limit => 64
    t.string   "visitdate",       :limit => 32
    t.string   "testtype_r",      :limit => 64
    t.string   "testtype_l",      :limit => 64
    t.string   "loss_r",          :limit => 64
    t.string   "loss_l",          :limit => 64
    t.string   "losstype_r",      :limit => 64
    t.string   "losstype_l",      :limit => 64
    t.string   "discrimscore_r",  :limit => 32
    t.string   "discrimscore_l",  :limit => 32
    t.string   "presentlevel_r",  :limit => 32
    t.string   "presentlevel_l",  :limit => 32
    t.string   "impedance_r",     :limit => 64
    t.string   "impedance_l",     :limit => 64
    t.text     "impedancenote_l"
    t.text     "impedancenote_r"
    t.string   "pbrollover_l",    :limit => 64
    t.string   "pbrollover_r",    :limit => 64
    t.integer  "hasmtid_l"
    t.integer  "hasmtid_r"
    t.text     "rectext"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.text     "reflex_l"
    t.text     "reflex_r"
    t.text     "rectext2"
    t.text     "followuptext"
    t.text     "retesttext"
    t.text     "referraltext"
  end

  create_table "aud_recs", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "audiogramid"
    t.string  "rec",         :limit => 256
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "auduserlink", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.integer  "appuserid"
    t.integer  "audid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "batteryclub", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "clientid"
    t.integer "referredclientid"
    t.date    "datereferral"
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "campaign", :id => false, :force => true do |t|
    t.integer  "campaignid",                       :null => false
    t.string   "externalcampaignid", :limit => 32
    t.string   "campaignname",       :limit => 64
    t.string   "campaigndesc"
    t.integer  "campaigntypeid"
    t.date     "datestarted"
    t.date     "dateended"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "campaignlu", :id => false, :force => true do |t|
    t.integer  "campaignluid",                  :null => false
    t.string   "lookupcategory", :limit => 127
    t.string   "lookupvalue",    :limit => 127
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "charts", :force => true do |t|
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "client", :id => false, :force => true do |t|
    t.integer  "clientid",                                     :null => false
    t.integer  "threadid"
    t.string   "nick",            :limit => 30
    t.string   "prefix",          :limit => 20
    t.string   "first",           :limit => 30
    t.string   "middle",          :limit => 30
    t.string   "last",            :limit => 30
    t.string   "suffix",          :limit => 30
    t.integer  "maritalstatusid"
    t.integer  "statusid"
    t.date     "dob"
    t.date     "anniversary"
    t.string   "deceased",        :limit => 1
    t.string   "etr",             :limit => 1
    t.string   "ssn",             :limit => 10
    t.string   "gender",          :limit => 1
    t.string   "spousename",      :limit => 50
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.string   "preferred",       :limit => 1
    t.string   "nomassmailing",   :limit => 1
    t.integer  "user_id",                       :default => 1
  end

  create_table "client_prospectonly", :id => false, :force => true do |t|
    t.string "nick",     :limit => 30
    t.string "first",    :limit => 30
    t.string "last",     :limit => 30
    t.string "address1", :limit => 50
    t.string "address2", :limit => 50
    t.string "city",     :limit => 30
    t.string "state",    :limit => 3
    t.string "zip",      :limit => 10
  end

  create_table "client_prospectonly_filt", :id => false, :force => true do |t|
    t.string "first",    :limit => nil
    t.string "last",     :limit => 30
    t.string "address1", :limit => 50
    t.string "address2", :limit => 50
    t.string "city",     :limit => 30
    t.string "state",    :limit => 3
    t.string "zip",      :limit => 10
  end

  create_table "client_test", :id => false, :force => true do |t|
    t.text   "btrim"
    t.string "first",    :limit => 30
    t.string "last",     :limit => 30
    t.string "address1", :limit => 50
    t.string "address2", :limit => 50
    t.string "city",     :limit => 30
    t.string "state",    :limit => 3
    t.string "zip",      :limit => 10
  end

  create_table "client_test2", :id => false, :force => true do |t|
    t.string "nick",     :limit => 30
    t.string "first",    :limit => 30
    t.string "last",     :limit => 30
    t.string "address1", :limit => 50
    t.string "address2", :limit => 50
    t.string "city",     :limit => 30
    t.string "state",    :limit => 3
    t.string "zip",      :limit => 10
  end

  create_table "clientaccount", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "clientid"
    t.datetime "laststatementdate"
    t.integer  "laststatementgeneratedby"
    t.datetime "created"
    t.integer  "createdby"
  end

  create_table "clientappt", :id => false, :force => true do |t|
    t.integer  "clientapptid",   :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "appuserid"
    t.datetime "datestart"
    t.datetime "dateend"
    t.integer  "apptypeid"
    t.integer  "appstatusid"
    t.string   "clientapptnote"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientcontact", :id => false, :force => true do |t|
    t.integer  "clientcontactid",               :null => false
    t.integer  "clientid"
    t.integer  "contacttypeid"
    t.integer  "threadid"
    t.string   "nick",            :limit => 30
    t.string   "prefix",          :limit => 20
    t.string   "first",           :limit => 30
    t.string   "middle",          :limit => 30
    t.string   "last",            :limit => 30
    t.string   "suffix",          :limit => 30
    t.string   "address1",        :limit => 50
    t.string   "address2",        :limit => 50
    t.string   "city",            :limit => 30
    t.string   "state",           :limit => 3
    t.string   "zip",             :limit => 10
    t.string   "email"
    t.string   "primarycontact",  :limit => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientcontactphone", :id => false, :force => true do |t|
    t.integer  "clientcontactphoneid",               :null => false
    t.integer  "clientcontactid"
    t.integer  "phonetypeid"
    t.integer  "threadid"
    t.string   "phonenumber",          :limit => 20
    t.string   "primaryphone",         :limit => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientdescription", :id => false, :force => true do |t|
    t.integer  "clientdescid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.text     "clientdesc"
  end

  create_table "clientevent", :id => false, :force => true do |t|
    t.integer  "clienteventid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "eventtypeid"
    t.date     "eventdate"
    t.string   "eventdesc"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientinterest", :id => false, :force => true do |t|
    t.integer  "clientinterestid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "interesttypeid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientjot", :id => false, :force => true do |t|
    t.integer  "clientjotid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.string   "clientjot"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientletter", :id => false, :force => true do |t|
    t.integer  "clientletterid", :null => false
    t.integer  "clientid"
    t.date     "datesent"
    t.integer  "lettertype"
    t.string   "letternote"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientlock", :id => false, :force => true do |t|
    t.string   "data",      :limit => 16, :null => false
    t.integer  "id",                      :null => false
    t.datetime "created"
    t.integer  "createdby"
  end

  create_table "clientlu", :id => false, :force => true do |t|
    t.integer  "clientluid",                    :null => false
    t.string   "lookupcategory", :limit => 127
    t.string   "lookupvalue",    :limit => 127
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientnote", :id => false, :force => true do |t|
    t.integer  "clientnoteid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.string   "notetext"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientpersonality", :id => false, :force => true do |t|
    t.integer  "clientpersonalityid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "activityid"
    t.integer  "advocacyid"
    t.integer  "timerequiredid"
    t.integer  "dexterityid"
    t.integer  "healthindexid"
    t.integer  "personalityid"
    t.integer  "selfhelpid"
    t.integer  "techattitudeid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientreferral", :id => false, :force => true do |t|
    t.integer  "clientreferralid",   :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "referredbyclientid"
    t.string   "referraltext"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientstatus", :id => false, :force => true do |t|
    t.integer  "clientstatusid", :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "statusid"
    t.string   "statusdesc"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientthread", :id => false, :force => true do |t|
    t.integer  "clientthreadid", :null => false
    t.integer  "threadid"
    t.integer  "clientid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "clientwhatsnext", :id => false, :force => true do |t|
    t.integer  "clientwhatsnextid",                             :null => false
    t.integer  "clientid"
    t.integer  "threadid"
    t.integer  "parentwhatsnextid",              :default => 0
    t.date     "datedue"
    t.date     "datecomplete"
    t.string   "whatsnextdesc"
    t.string   "priority",          :limit => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "assignedto"
    t.integer  "assignedtogroup"
    t.datetime "read"
    t.integer  "service",           :limit => 2
  end

  add_index "clientwhatsnext", ["read"], :name => "clientwhatsnext_read_idx"

  create_table "clinic", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",       :limit => 128
    t.integer "addressid"
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
    t.string  "website",    :limit => 64
    t.text    "notes"
  end

  create_table "contact", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "namefirst",      :limit => 16
    t.string  "namelast",       :limit => 16
    t.string  "namemiddle",     :limit => 16
    t.string  "email",          :limit => 64
    t.integer "jobid"
    t.integer "manufacturerid"
    t.integer "addressid"
    t.string  "ohp",            :limit => 56
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
    t.string  "title",          :limit => 128
    t.string  "upin",           :limit => 128
    t.text    "notes"
    t.string  "phone",          :limit => 16
    t.string  "fax",            :limit => 16
    t.integer "primarycontact", :limit => 2
    t.integer "optin",          :limit => 2,   :default => 1
  end

  create_table "contactlu", :id => false, :force => true do |t|
    t.integer  "id",                       :null => false
    t.string   "category",   :limit => 16
    t.string   "value",      :limit => 28
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "contract", :id => false, :force => true do |t|
    t.integer  "id",                                                          :null => false
    t.integer  "clientid"
    t.string   "namefull",     :limit => 128
    t.string   "address",      :limit => 128
    t.string   "citystatezip", :limit => 128
    t.string   "tele",         :limit => 16
    t.date     "datedrawn"
    t.string   "audiologist",  :limit => 64
    t.string   "idleft",       :limit => 32
    t.string   "brleft",       :limit => 64
    t.date     "weleft"
    t.date     "ldleft"
    t.string   "idright",      :limit => 32
    t.string   "brright",      :limit => 64
    t.date     "weright"
    t.date     "ldright"
    t.string   "idrc",         :limit => 32
    t.integer  "trialperiod"
    t.decimal  "price",                        :precision => 16, :scale => 2
    t.decimal  "fee",                          :precision => 16, :scale => 2
    t.decimal  "deductible",                   :precision => 16, :scale => 2
    t.string   "terms",        :limit => 1024
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "feedback", :id => false, :force => true do |t|
    t.integer  "id",                      :null => false
    t.string   "tom",       :limit => 30
    t.string   "fromm",     :limit => 30
    t.string   "name",      :limit => 30
    t.string   "phone",     :limit => 30
    t.string   "email",     :limit => 30
    t.text     "message"
    t.datetime "created"
    t.integer  "createdby"
  end

  create_table "habrandmodellist", :id => false, :force => true do |t|
    t.integer  "habrandmodellistid", :null => false
    t.integer  "brandid"
    t.integer  "modelid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "manufid"
  end

  create_table "hamodelcircuitlist", :id => false, :force => true do |t|
    t.integer  "hamodelcircuitlistid", :null => false
    t.integer  "modelid"
    t.integer  "circuitid"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "hearingaid", :id => false, :force => true do |t|
    t.integer  "hearingaidid",                    :null => false
    t.integer  "clientid"
    t.integer  "appuserid"
    t.integer  "threadid"
    t.string   "serialnum",        :limit => 30
    t.string   "invoicenum",       :limit => 30
    t.string   "invoicenum2",      :limit => 30
    t.string   "amount",           :limit => 10
    t.string   "ear",              :limit => 1
    t.string   "primaryha",        :limit => 1
    t.integer  "manufacturerid"
    t.integer  "ldmanufacturerid"
    t.integer  "brandid"
    t.integer  "modelid"
    t.integer  "circuitid"
    t.integer  "typeid"
    t.integer  "batteryid"
    t.integer  "statusid"
    t.integer  "fittingresultid"
    t.string   "note",             :limit => 256
    t.date     "fittingdate"
    t.date     "contractdate"
    t.date     "warrantyexpdate"
    t.date     "ldexpdate"
    t.date     "rfcdate"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "wmanufacturerid"
    t.integer  "styleid"
    t.integer  "audid"
    t.date     "orderdate"
    t.date     "invoicedate"
    t.date     "creditdate"
  end

  create_table "hearingaidinvoice", :id => false, :force => true do |t|
    t.integer "createdby"
    t.integer "modifiedby"
  end

  create_table "hearingaidlu", :id => false, :force => true do |t|
    t.integer  "hearingaidluid"
    t.string   "lookupcategory", :limit => 128
    t.string   "lookupvalue",    :limit => 512
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "active",         :limit => 2
    t.integer  "displayorder"
  end

  create_table "hearingaidoption", :id => false, :force => true do |t|
    t.integer  "hearingaidoptionid", :null => false
    t.integer  "hearingaidid"
    t.integer  "threadid"
    t.integer  "optionid"
    t.datetime "created"
    t.integer  "createby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "createdby"
  end

  create_table "hearingasmt", :id => false, :force => true do |t|
    t.integer  "hearingasmtid",                   :null => false
    t.integer  "clientid"
    t.integer  "audid"
    t.integer  "threadid"
    t.string   "ear",               :limit => 1
    t.integer  "lossid"
    t.integer  "losstypeid"
    t.integer  "canalsizeid"
    t.integer  "canalshapeid"
    t.integer  "discrimscore"
    t.integer  "presentationlevel"
    t.date     "datetest"
    t.string   "note"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "appuserid"
    t.integer  "hearingtesttypeid"
    t.integer  "impedanceid"
    t.integer  "reflexid"
    t.text     "reflexnote"
    t.text     "impedancenote"
    t.string   "sts",               :limit => 1
    t.string   "rollover",          :limit => 32
  end

  create_table "hearingasmtlu", :id => false, :force => true do |t|
    t.integer  "hearingasmtluid",                :null => false
    t.string   "lookupcategory",  :limit => 127
    t.string   "lookupvalue",     :limit => 127
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "hearingasmtnote", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.integer  "clientid"
    t.date     "datetest"
    t.string   "note"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "hours", :id => false, :force => true do |t|
    t.integer  "id",                :null => false
    t.text     "eventtype"
    t.time     "starttime"
    t.integer  "datepatdayofweek"
    t.datetime "startefftime"
    t.integer  "datepatdayofmonth"
    t.time     "endtime"
    t.integer  "datepatmonth"
    t.datetime "endefftime"
    t.integer  "associd"
    t.integer  "datepatyear"
    t.text     "comment"
  end

  create_table "hplanet", :id => false, :force => true do |t|
    t.integer  "id",                                                        :null => false
    t.date     "invoicedate"
    t.string   "company",     :limit => 64
    t.string   "invoicenum",  :limit => 32
    t.integer  "credit"
    t.decimal  "amount",                     :precision => 16, :scale => 2
    t.string   "namelast",    :limit => 64
    t.string   "namefirst",   :limit => 64
    t.decimal  "ifee",                       :precision => 16, :scale => 2
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.date     "orderdate"
    t.string   "type",        :limit => 32
    t.string   "note",        :limit => 128
  end

  create_table "hplanetcomplu", :id => false, :force => true do |t|
    t.integer  "id",                       :null => false
    t.string   "compname",   :limit => 64
    t.string   "descr",      :limit => 64
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  add_index "hplanetcomplu", ["compname"], :name => "hplanetcomplu_compname_key", :unique => true

  create_table "hplanetpmts", :id => false, :force => true do |t|
    t.integer  "id",                                                       :null => false
    t.date     "pmtdate"
    t.decimal  "pmtamt",                    :precision => 16, :scale => 2
    t.string   "pmtchecknum", :limit => 32
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "jms_roles", :id => false, :force => true do |t|
    t.string "roleid", :limit => 32, :null => false
    t.string "userid", :limit => 32, :null => false
  end

  create_table "jms_subscriptions", :id => false, :force => true do |t|
    t.string "clientid", :limit => 128, :null => false
    t.string "subname",  :limit => 128, :null => false
    t.string "topic",                   :null => false
    t.string "selector"
  end

  create_table "jms_users", :id => false, :force => true do |t|
    t.string "userid",   :limit => 32,  :null => false
    t.string "passwd",   :limit => 32,  :null => false
    t.string "clientid", :limit => 128
  end

  create_table "lettertype", :id => false, :force => true do |t|
    t.integer  "lettertypeid",                :null => false
    t.string   "lettertypename"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "active",         :limit => 2
  end

  create_table "lineitemdescription", :id => false, :force => true do |t|
    t.integer  "id",                                                                         :null => false
    t.datetime "created"
    t.integer  "createdby"
    t.string   "description",   :limit => 128
    t.decimal  "defaultamount",                :precision => 16, :scale => 2
    t.integer  "predefined",    :limit => 2
    t.integer  "debitflag",     :limit => 2
    t.integer  "pending",       :limit => 2
    t.integer  "active",        :limit => 2,                                  :default => 1
    t.string   "procedurecode", :limit => 128
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "manufacct", :id => false, :force => true do |t|
    t.integer  "id",                                      :null => false
    t.integer  "manufid"
    t.string   "acct",       :limit => 32
    t.integer  "active",                   :default => 1
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "manufacturer", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "name",       :limit => 128
    t.integer "addressid"
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
    t.string  "website",    :limit => 64
    t.text    "notes"
    t.string  "acct",       :limit => 32
  end

  create_table "news", :id => false, :force => true do |t|
    t.integer  "newsid",                     :null => false
    t.integer  "categoryid"
    t.string   "title",      :limit => 128
    t.string   "text",       :limit => 2048
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "newslu", :id => false, :force => true do |t|
    t.integer  "newsluid",                      :null => false
    t.string   "lookupcategory", :limit => 127
    t.string   "lookupvalue",    :limit => 127
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "notes", :force => true do |t|
    t.integer  "chart_id"
    t.text     "details"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.date     "date"
  end

  create_table "officewhatsnext", :id => false, :force => true do |t|
    t.integer  "officewhatsnextid",                :null => false
    t.integer  "parentwhatsnextid", :default => 0
    t.date     "datedue"
    t.date     "datecomplete"
    t.integer  "assignedto"
    t.integer  "assignedtogroup"
    t.integer  "priority"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.datetime "read"
    t.text     "whatsnextdesc"
  end

  add_index "officewhatsnext", ["read"], :name => "officewhatsnext_read_idx"

  create_table "patientreferral", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "clientid"
    t.integer  "referredclientid"
    t.datetime "datereferral"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "pcp", :id => false, :force => true do |t|
    t.integer  "id",                                       :null => false
    t.string   "namefirst",  :limit => nil
    t.string   "namemiddle", :limit => nil
    t.string   "namelast",   :limit => nil,                :null => false
    t.string   "ssn",        :limit => 12
    t.date     "dob"
    t.string   "type",       :limit => 12
    t.integer  "pcpid"
    t.string   "address1",   :limit => nil
    t.string   "address2",   :limit => nil
    t.string   "city",       :limit => nil
    t.string   "state",      :limit => nil
    t.string   "zip",        :limit => nil
    t.string   "tel1",       :limit => nil
    t.string   "tel2",       :limit => nil
    t.string   "tel3",       :limit => nil
    t.string   "email",      :limit => 32
    t.string   "commments",  :limit => 512
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
    t.integer  "active",                    :default => 1
  end

  create_table "pga_forms", :id => false, :force => true do |t|
    t.string "formname",   :limit => 64
    t.text   "formsource"
  end

  create_table "pga_layout", :id => false, :force => true do |t|
    t.string  "tablename", :limit => 64
    t.integer "nrcols",    :limit => 2
    t.text    "colnames"
    t.text    "colwidth"
  end

  create_table "pga_queries", :id => false, :force => true do |t|
    t.string "queryname",     :limit => 64
    t.string "querytype",     :limit => 1
    t.text   "querycommand"
    t.text   "querytables"
    t.text   "querylinks"
    t.text   "queryresults"
    t.text   "querycomments"
  end

  create_table "pga_reports", :id => false, :force => true do |t|
    t.string "reportname",    :limit => 64
    t.text   "reportsource"
    t.text   "reportbody"
    t.text   "reportprocs"
    t.text   "reportoptions"
  end

  create_table "pga_schema", :id => false, :force => true do |t|
    t.string "schemaname",   :limit => 64
    t.text   "schematables"
    t.text   "schemalinks"
  end

  create_table "pga_scripts", :id => false, :force => true do |t|
    t.string "scriptname",   :limit => 64
    t.text   "scriptsource"
  end

  create_table "pgadmin_desc", :id => false, :force => true do |t|
    t.integer "objoid"
    t.text    "description"
  end

  create_table "pgadmin_param", :id => false, :force => true do |t|
    t.integer "param_id"
    t.text    "param_value"
    t.text    "param_desc"
  end

  create_table "pgadmin_rev_log", :id => false, :force => true do |t|
    t.datetime "event_timestamp"
    t.text     "username"
    t.float    "version"
    t.text     "query"
  end

  create_table "pgadmin_seq_cache", :id => false, :force => true do |t|
    t.integer  "sequence_oid"
    t.integer  "sequence_last_value"
    t.integer  "sequence_increment_by"
    t.integer  "sequence_max_value"
    t.integer  "sequence_min_value"
    t.integer  "sequence_cache_value"
    t.text     "sequence_is_cycled"
    t.datetime "sequence_timestamp"
  end

# Could not dump table "pgadmin_sequences" because of following StandardError
#   Unknown type 'name' for column 'sequence_name'

  create_table "pgadmin_table_cache", :id => false, :force => true do |t|
    t.integer  "table_oid"
    t.integer  "table_rows"
    t.datetime "table_timestamp"
  end

# Could not dump table "pgadmin_tables" because of following StandardError
#   Unknown type 'name' for column 'table_name'

  create_table "physician", :id => false, :force => true do |t|
    t.text    "name"
    t.integer "id",   :null => false
  end

  create_table "physicianreferral", :id => false, :force => true do |t|
    t.integer  "id"
    t.integer  "referredclientid"
    t.integer  "staffid"
    t.datetime "datereferral"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "prospect", :id => false, :force => true do |t|
    t.integer "setid"
    t.integer "clientid"
    t.integer "clientcontactid"
    t.text    "first"
    t.text    "nick"
    t.text    "last"
    t.text    "addr1"
    t.text    "addr2"
    t.text    "city"
    t.text    "state"
    t.text    "zip"
    t.text    "tele"
    t.text    "dob"
    t.text    "datetest"
    t.text    "loss"
    t.text    "losstype"
    t.text    "datefitting"
    t.text    "circuit"
    t.text    "style"
    t.text    "lastletter"
    t.text    "datelastletter"
    t.text    "datelastvisit"
  end

  create_table "repair", :id => false, :force => true do |t|
    t.integer "id",                             :null => false
    t.integer "clientid"
    t.string  "status",          :limit => 64
    t.string  "namefull",        :limit => 128
    t.date    "datedrawn"
    t.string  "audiologist",     :limit => 64
    t.string  "accountnumber",   :limit => 32
    t.date    "dateinvoice"
    t.string  "manufacturer",    :limit => 64
    t.string  "comments",        :limit => 256
    t.string  "auth",            :limit => 64
    t.string  "additionalitems", :limit => 256
    t.integer "sonussolution",   :limit => 2
    t.integer "multinvoices",    :limit => 2
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "repairha", :id => false, :force => true do |t|
    t.integer "id",                         :null => false
    t.integer "repairid"
    t.string  "serialnumber", :limit => 64
    t.string  "model",        :limit => 64
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "repairreason", :id => false, :force => true do |t|
    t.integer "id",                        :null => false
    t.integer "repairid"
    t.integer "reasonid"
    t.string  "text",       :limit => 128
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "return", :id => false, :force => true do |t|
    t.integer "id",                              :null => false
    t.integer "clientid"
    t.string  "status",           :limit => 64
    t.string  "namefull",         :limit => 128
    t.date    "datedrawn"
    t.string  "audiologist",      :limit => 64
    t.string  "accountnumber",    :limit => 32
    t.date    "dateinvoice"
    t.string  "manufacturer",     :limit => 64
    t.string  "comments",         :limit => 512
    t.string  "auth",             :limit => 64
    t.string  "additionalitems",  :limit => 512
    t.integer "sonussolution",    :limit => 2
    t.integer "multinvoices",     :limit => 2
    t.integer "updateaccounting", :limit => 2
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "returnha", :id => false, :force => true do |t|
    t.integer  "id",                         :null => false
    t.integer  "returnid"
    t.string   "serialnumber", :limit => 64
    t.string   "model",        :limit => 64
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "returnreason", :id => false, :force => true do |t|
    t.integer  "id",                        :null => false
    t.integer  "returnid"
    t.integer  "reasonid"
    t.string   "text",       :limit => 128
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "roles", :id => false, :force => true do |t|
    t.integer  "rolesid",                   :null => false
    t.string   "principalid", :limit => 32
    t.string   "role",        :limit => 32
    t.string   "rolegroup",   :limit => 32
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "savedreport", :id => false, :force => true do |t|
    t.integer  "id",            :null => false
    t.text     "reporttype"
    t.text     "reportname"
    t.text     "patientstatus"
    t.text     "datetest"
    t.text     "losses"
    t.text     "losstypes"
    t.text     "datefitting"
    t.text     "circuits"
    t.text     "styles"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "staff", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "namefirst",    :limit => 16
    t.string  "namelast",     :limit => 16
    t.string  "namemiddle",   :limit => 16
    t.string  "email",        :limit => 64
    t.integer "jobid"
    t.integer "clinicid"
    t.integer "addressid"
    t.string  "ohp",          :limit => 56
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
    t.string  "title",        :limit => 128
    t.string  "upin",         :limit => 128
    t.text    "notes"
    t.string  "phone",        :limit => 16
    t.string  "fax",          :limit => 16
    t.integer "primarystaff", :limit => 2
    t.integer "optin",        :limit => 2,   :default => 1
  end

  create_table "stafflu", :id => false, :force => true do |t|
    t.integer  "id",                       :null => false
    t.string   "category",   :limit => 16
    t.string   "value",      :limit => 28
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "taggings", :force => true do |t|
    t.integer  "note_id"
    t.integer  "tag_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tags", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "temp_cc", :id => false, :force => true do |t|
    t.integer "id"
    t.integer "audiogramid"
    t.string  "cc",          :limit => 128
    t.date    "created"
    t.integer "createdby"
    t.date    "modified"
    t.integer "modifiedby"
  end

  create_table "temp_client", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "nickname",      :limit => 30
    t.string  "prefix",        :limit => 20
    t.string  "first",         :limit => 30
    t.string  "middle",        :limit => 30
    t.string  "last",          :limit => 30
    t.string  "suffix",        :limit => 30
    t.string  "maritalstatus", :limit => 127
    t.date    "dob"
    t.date    "anniversary"
    t.string  "deceased",      :limit => 1
    t.string  "etr",           :limit => 1
    t.string  "preferred",     :limit => 1
    t.string  "ssn",           :limit => 10
    t.string  "gender",        :limit => 1
    t.string  "spousename",    :limit => 50
    t.string  "nomassmailing", :limit => 1
    t.string  "address1",      :limit => 50
    t.string  "address2",      :limit => 50
    t.string  "city",          :limit => 30
    t.string  "state",         :limit => 3
    t.string  "zip",           :limit => 10
    t.string  "email"
  end

  create_table "temp_client_both", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "nickname",      :limit => 30
    t.string  "prefix",        :limit => 20
    t.string  "first",         :limit => 30
    t.string  "middle",        :limit => 30
    t.string  "last",          :limit => 30
    t.string  "suffix",        :limit => 30
    t.string  "maritalstatus", :limit => 127
    t.date    "dob"
    t.date    "anniversary"
    t.string  "deceased",      :limit => 1
    t.string  "etr",           :limit => 1
    t.string  "preferred",     :limit => 1
    t.string  "ssn",           :limit => 10
    t.string  "gender",        :limit => 1
    t.string  "spousename",    :limit => 50
    t.string  "nomassmailing", :limit => 1
    t.string  "address1",      :limit => 50
    t.string  "address2",      :limit => 50
    t.string  "city",          :limit => 30
    t.string  "state",         :limit => 3
    t.string  "zip",           :limit => 10
    t.string  "email"
    t.date    "datefit_l"
    t.string  "brand_l",       :limit => 512
    t.string  "model_l",       :limit => 512
    t.string  "serialnum_l",   :limit => 30
    t.date    "datewarr_l"
    t.date    "datefit_r"
    t.string  "brand_r",       :limit => 512
    t.string  "model_r",       :limit => 512
    t.string  "serialnum_r",   :limit => 30
    t.date    "datewarr_r"
  end

  create_table "temp_client_left", :id => false, :force => true do |t|
    t.integer "id"
    t.string  "nickname",      :limit => 30
    t.string  "prefix",        :limit => 20
    t.string  "first",         :limit => 30
    t.string  "middle",        :limit => 30
    t.string  "last",          :limit => 30
    t.string  "suffix",        :limit => 30
    t.string  "maritalstatus", :limit => 127
    t.date    "dob"
    t.date    "anniversary"
    t.string  "deceased",      :limit => 1
    t.string  "etr",           :limit => 1
    t.string  "preferred",     :limit => 1
    t.string  "ssn",           :limit => 10
    t.string  "gender",        :limit => 1
    t.string  "spousename",    :limit => 50
    t.string  "nomassmailing", :limit => 1
    t.string  "address1",      :limit => 50
    t.string  "address2",      :limit => 50
    t.string  "city",          :limit => 30
    t.string  "state",         :limit => 3
    t.string  "zip",           :limit => 10
    t.string  "email"
    t.date    "datefit_l"
    t.string  "brand_l",       :limit => 512
    t.string  "model_l",       :limit => 512
    t.string  "serialnum_l",   :limit => 30
    t.date    "datewarr_l"
  end

  create_table "temp_left", :id => false, :force => true do |t|
    t.integer "clientid"
    t.date    "datefit"
    t.string  "ear",       :limit => 1
    t.string  "brand",     :limit => 512
    t.string  "model",     :limit => 512
    t.integer "brandid"
    t.integer "modelid"
    t.string  "serialnum", :limit => 30
    t.date    "datewarr"
  end

  create_table "temp_right", :id => false, :force => true do |t|
    t.integer "clientid"
    t.date    "datefit"
    t.string  "ear",       :limit => 1
    t.string  "brand",     :limit => 512
    t.string  "model",     :limit => 512
    t.integer "brandid"
    t.integer "modelid"
    t.string  "serialnum", :limit => 30
    t.date    "datewarr"
  end

  create_table "thread", :id => false, :force => true do |t|
    t.integer  "threadid",    :null => false
    t.integer  "campaignid"
    t.string   "threaddesc"
    t.date     "datestarted"
    t.date     "dateended"
    t.datetime "created"
    t.integer  "createdby"
    t.datetime "modified"
    t.integer  "modifiedby"
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
