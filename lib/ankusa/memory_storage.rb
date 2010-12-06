module Ankusa

  class MemoryStorage
    def initialize
      init_tables
    end

    def classnames
      @total_doc_counts.keys
    end

    def reset
      init_tables
    end
    
    def drop_tables
    end

    def init_tables
      @freqs = {}
      @total_word_counts = Hash.new(0)
      @total_doc_counts = Hash.new(0)
      @klass_word_counts = {}
      @klass_doc_counts = {}
    end

    def get_word_counts(word)
      @freqs.fetch word, Hash.new(0)
    end

    def get_total_word_count(klass)
      @total_word_counts[klass]
    end
    
    def get_doc_count(klass)
      @total_doc_counts[klass]
    end

    def incr_word_count(klass, word, count)
      @freqs[word] ||= Hash.new(0)
      @freqs[word][klass] += count
    end

    def incr_total_word_count(klass, count)
      @total_word_counts[klass] += count
    end

    def incr_doc_count(klass, count)
      @total_doc_counts[klass] += count
    end

    def doc_count_total(classes=nil)
      classes ||= @total_doc_counts.keys
      @total_doc_counts.select { |k,v| classes.include? k }.map { |k,v| v }.inject { |x,y| x+y }
    end

    def close
    end

  end

end