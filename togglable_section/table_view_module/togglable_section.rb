module TableViewModule
  module TogglableSection

    def toggle_section index
      @section_statuses ||= build_section_statuses

      @section_statuses[index] = !!!@section_statuses[index]
    end

    def tableView table_view, viewForHeaderInSection:section
      @section_view ||= []

      if @section_view[section]
        view = @section_view[section]
      else
        view = TogglableTableHeaderView.new
        view.tableView = table_view

        @section_view[section] = view
      end

      return view
    end

    def tableView table_view, heightForRowAtIndexPath:index_path
      @section_statuses ||= build_section_statuses

      @section_statuses[index_path.section] == true ? 43.0 : 0.0
    end

    def build_section_statuses
      self.table_data.map do |section|
        # TODO: current vertion default: false (hidden)
        section[:title].nil? ? nil : false
      end
    end
    private :build_section_statuses

  end
end
