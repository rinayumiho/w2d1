# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
    def span
        return nil if self.empty?
        self.max - self.min
    end

    def average
        return nil if self.empty?
        self.sum / (self.length * 1.0)
    end

    def median
        return nil if self.empty?
        self.sort!
        n = self.length
        return self[n / 2] if n.odd?
        (self[(n - 1) / 2] + self[n / 2]) / 2.0
    end

    def counts
        hash = Hash.new(0)
        self.each { |e| hash[e] += 1 }
        hash
    end

    def my_count(val)
        ct = 0
        self.each { |ele| ct += 1 if ele == val }
        ct
    end

    def my_index(val)
        self.each_with_index { |ele, i| return i if ele == val}
        nil
    end

    def my_uniq
        res = []
        self.each { |e| res << e if !res.include?(e) }
        res
    end

    def my_transpose
        n = self.length
        (0...n).each do |i|
            (0...n).each do |j|
                self[i][j], self[j][i] = self[j][i], self[i][j] if i < j
            end
        end
        self
    end
end
