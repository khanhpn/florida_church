class AddMainArticleToTeachingMass < ActiveRecord::Migration[6.1]
  def change
    # teaching mass
    add_column :teaching_masses, :is_main_article, :boolean, default: false
    add_column :teaching_masses, :file_image, :text
    add_column :teaching_masses, :file_pdf, :text

    # altar societies
    add_column :altar_societies, :is_main_article, :boolean, default: false
    add_column :altar_societies, :file_image, :text
    add_column :altar_societies, :file_pdf, :text

    # childrens_liturgies
    add_column :childrens_liturgies, :is_main_article, :boolean, default: false
    add_column :childrens_liturgies, :file_image, :text
    add_column :childrens_liturgies, :file_pdf, :text

    # ecuharistic_ministries
    add_column :ecuharistic_ministries, :is_main_article, :boolean, default: false
    add_column :ecuharistic_ministries, :file_image, :text
    add_column :ecuharistic_ministries, :file_pdf, :text

    # funerals
    add_column :funerals, :is_main_article, :boolean, default: false
    add_column :funerals, :file_image, :text
    add_column :funerals, :file_pdf, :text

    # lectors
    add_column :lectors, :is_main_article, :boolean, default: false
    add_column :lectors, :file_image, :text
    add_column :lectors, :file_pdf, :text

    # music_ministries
    add_column :music_ministries, :is_main_article, :boolean, default: false
    add_column :music_ministries, :file_image, :text
    add_column :music_ministries, :file_pdf, :text

    # ushers_hospitalities
    add_column :ushers_hospitalities, :is_main_article, :boolean, default: false
    add_column :ushers_hospitalities, :file_image, :text
    add_column :ushers_hospitalities, :file_pdf, :text

    # prayer_groups
    add_column :prayer_groups, :is_main_article, :boolean, default: false
    add_column :prayer_groups, :file_image, :text
    add_column :prayer_groups, :file_pdf, :text

    # baptisms
    add_column :baptisms, :is_main_article, :boolean, default: false
    add_column :baptisms, :file_image, :text
    add_column :baptisms, :file_pdf, :text

    # reconciliations
    add_column :reconciliations, :is_main_article, :boolean, default: false
    add_column :reconciliations, :file_image, :text
    add_column :reconciliations, :file_pdf, :text

    # eucharists
    add_column :eucharists, :is_main_article, :boolean, default: false
    add_column :eucharists, :file_image, :text
    add_column :eucharists, :file_pdf, :text

    # confirmations
    add_column :confirmations, :is_main_article, :boolean, default: false
    add_column :confirmations, :file_image, :text
    add_column :confirmations, :file_pdf, :text

    # marriages
    add_column :marriages, :is_main_article, :boolean, default: false
    add_column :marriages, :file_image, :text
    add_column :marriages, :file_pdf, :text

    # holyorders
    add_column :holyorders, :is_main_article, :boolean, default: false
    add_column :holyorders, :file_image, :text
    add_column :holyorders, :file_pdf, :text

    # anointing_thesicks
    add_column :anointing_thesicks, :is_main_article, :boolean, default: false
    add_column :anointing_thesicks, :file_image, :text
    add_column :anointing_thesicks, :file_pdf, :text

    # sacramentals
    add_column :sacramentals, :is_main_article, :boolean, default: false
    add_column :sacramentals, :file_image, :text
    add_column :sacramentals, :file_pdf, :text
  end
end
