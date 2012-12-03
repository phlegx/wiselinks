module Wiselinks
  module Headers    

  protected

    def wiselinks_layout
      'wiselinks'
    end

    def render(options = {}, *args, &block)
      if self.wiselinks_request?
        if options[:partial].blank? && self.wiselinks_partial_request?
          options[:partial] = action_name
        else
          options[:layout] = self.wiselinks_layout        
        end
      end

      super
    end

    def wiselinks_request?
      request.headers['X-Slide'].present?
    end

    def wiselinks_template_request?
      self.wiselinks_request? && request.headers['X-Slide'] != 'partial'
    end

    def wiselinks_partial_request?
      self.wiselinks_request? && request.headers['X-Slide'] == 'partial'
    end
  end
end