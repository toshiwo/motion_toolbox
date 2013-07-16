module TableViewModule
  module TogglableSection

    def self.included base
      base.send :alias_method, :'tableViewOrigin:numberOfRowsInSection', :'tableView:numberOfRowsInSection'

      base.send :include, InstanceMethods
    end

    module InstanceMethods
      def tableView table_view, numberOfRowsInSection:section
        if section_statuses[section] == true
          tableViewOrigin table_view, numberOfRowsInSection:section
        else
          0
        end
      end
    end

    # dependency ProMotion's method
    def update_table_data
      clear_section_statuses

      super
    end

    # dependency ProMotion's method
    def update_table_view_data
      clear_section_statuses

      super
    end

    def toggle_section index
      section_statuses[index] = !!!section_statuses[index]
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

    def section_statuses
      @section_statuses ||= build_section_statuses
    end
    private :section_statuses

    def build_section_statuses
      self.table_data.map do |section|
        # dependency ProMotion::TableScreen's table data structure
        # TODO: current vertion default: false (hidden)
        section[:title].nil? ? nil : false
      end
    end
    private :build_section_statuses

    def clear_section_statuses
      @section_statuses = nil
    end
    private :clear_section_statuses

  end
end
