class AddMainArticleToAboutUs < ActiveRecord::Migration[6.1]
  def change
     add_column :welcomes, :is_main_article, :boolean, default: false, index: true
     add_column :welcomes, :file_image, :text
     add_column :welcomes, :file_pdf, :text
     add_column :welcomes, :name_link, :text

     add_column :clergies, :is_main_article, :boolean, default: false, index: true
     add_column :clergies, :file_image, :text
     add_column :clergies, :file_pdf, :text
     add_column :clergies, :name_link, :text

     add_column :deacons, :is_main_article, :boolean, default: false, index: true
     add_column :deacons, :file_image, :text
     add_column :deacons, :file_pdf, :text
     add_column :deacons, :name_link, :text

     add_column :staffs, :is_main_article, :boolean, default: false, index: true
     add_column :staffs, :file_image, :text
     add_column :staffs, :file_pdf, :text
     add_column :staffs, :name_link, :text

     add_column :councils, :is_main_article, :boolean, default: false, index: true
     add_column :councils, :file_image, :text
     add_column :councils, :file_pdf, :text
     add_column :councils, :name_link, :text

     add_column :history_churches, :is_main_article, :boolean, default: false, index: true
     add_column :history_churches, :file_image, :text
     add_column :history_churches, :file_pdf, :text
     add_column :history_churches, :name_link, :text

     add_column :environment_churches, :is_main_article, :boolean, default: false, index: true
     add_column :environment_churches, :file_image, :text
     add_column :environment_churches, :file_pdf, :text
     add_column :environment_churches, :name_link, :text

     add_column :teaching_masses, :name_link, :text
     add_column :altar_societies, :name_link, :text
     add_column :altar_servers, :name_link, :text
     add_column :childrens_liturgies, :name_link, :text
     add_column :ecuharistic_ministries, :name_link, :text
     add_column :funerals, :name_link, :text
     add_column :lectors, :name_link, :text
     add_column :music_ministries, :name_link, :text
     add_column :ushers_hospitalities, :name_link, :text
     add_column :prayer_groups, :name_link, :text
     add_column :baptisms, :name_link, :text
     add_column :reconciliations, :name_link, :text
     add_column :eucharists, :name_link, :text
     add_column :confirmations, :name_link, :text
     add_column :marriages, :name_link, :text
     add_column :holyorders, :name_link, :text
     add_column :anointing_thesicks, :name_link, :text
     add_column :sacramentals, :name_link, :text

     add_column :welcomes, :display, :boolean, default: false, index: true
  end
end
