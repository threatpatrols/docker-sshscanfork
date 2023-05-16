module SSHScan
  module OS
    class Ubuntu
      attr_reader :version

      class Version
        def initialize(version_string)
          @version_string = version_string
        end

        def to_s
          @version_string
        end
      end

      # Obtained from scraping ChangeLog on Launchpad
      FINGERPRINTS = {
         "4.10"=>[],
         "5.04"=>[],
         "5.10"=>[],
         "6.04"=>[],
         "6.10"=>[],
         "7.04"=>[],
         "7.10"=>[],
         "8.04"=>[],
         "8.10"=>[],
         "9.04"=>[],
         "9.10"=>[],
         "10.04"=>["5.3p1-3ubuntu7.1"],
         "10.10"=>[],
         "11.04"=>[],
         "11.10"=>[],
         "12.04"=>
          ["5.9p1-5ubuntu1.10",
           "5.9p1-5ubuntu1.9",
           "5.9p1-5ubuntu1.8",
           "5.9p1-5ubuntu1.7",
           "5.9p1-5ubuntu1.6",
           "5.9p1-5ubuntu1.4",
           "5.9p1-5ubuntu1.3",
           "5.9p1-5ubuntu1.2",
           "5.9p1-5ubuntu1.1",
           "5.9p1-5ubuntu1",
           "5.9p1-4ubuntu1",
           "5.9p1-3ubuntu1",
           "5.9p1-2ubuntu2",
           "5.9p1-2ubuntu1",
           "5.9p1-1ubuntu1"],
         "12.10"=>
          ["6.0p1-3ubuntu1.2",
           "6.0p1-3ubuntu1.1",
           "6.0p1-3ubuntu1",
           "6.0p1-2ubuntu1",
           "6.0p1-1ubuntu1"],
         "13.04"=>["6.1p1-1ubuntu1"],
         "13.10"=>
          ["6.2p2-6ubuntu0.5",
           "6.2p2-6ubuntu0.4",
           "6.2p2-6ubuntu0.3",
           "6.2p2-6ubuntu0.2",
           "6.2p2-6ubuntu0.1"],
         "14.04"=>
          ["6.6p1-2ubuntu2.13",
           "6.6p1-2ubuntu2.12",
           "6.6p1-2ubuntu2.11",
           "6.6p1-2ubuntu2.10",
           "6.6p1-2ubuntu2.8",
           "6.6p1-2ubuntu2.7",
           "6.6p1-2ubuntu2.6",
           "6.6p1-2ubuntu2.5",
           "6.6p1-2ubuntu2.4",
           "6.6p1-2ubuntu2.3",
           "6.6p1-2ubuntu2.2",
           "6.6p1-2ubuntu2",
           "6.6p1-2ubuntu1",
           "6.2p2-6ubuntu1"],
         "14.10"=>["6.6p1-5build1"],
         "15.04"=>
          ["6.7p1-5ubuntu1.4",
           "6.7p1-5ubuntu1.3",
           "6.7p1-5ubuntu1.2",
           "6.7p1-5ubuntu1"],
         "15.10"=>
          ["6.9p1-2ubuntu0.2", "6.9p1-2ubuntu0.1", "6.7p1-6ubuntu2", "6.7p1-6ubuntu1"],
         "16.04"=>
          ["7.2p2-4ubuntu2.10",
           "7.2p2-4ubuntu2.9",
           "7.2p2-4ubuntu2.8",
           "7.2p2-4ubuntu2.7",
           "7.2p2-4ubuntu2.6",
           "7.2p2-4ubuntu2.5",
           "7.2p2-4ubuntu2.4",
           "7.2p2-4ubuntu2.2",
           "7.2p2-4ubuntu2.1",
           "7.2p2-4ubuntu2",
           "7.2p2-4ubuntu1"],
         "16.10"=>["7.3p1-1ubuntu0.1"],
         "17.04"=>["7.4p1-10ubuntu0.1", "7.3p1-3build1"],
         "17.10"=>
          ["7.5p1-10ubuntu0.1",
           "7.5p1-7ubuntu2",
           "7.5p1-7ubuntu1",
           "7.5p1-6ubuntu1",
           "7.5p1-5ubuntu1",
           "7.5p1-3ubuntu1"],
         "18.04"=>
          ["7.6p1-4ubuntu0.7",
           "7.6p1-4ubuntu0.6",
           "7.6p1-4ubuntu0.5",
           "7.6p1-4ubuntu0.4",
           "7.6p1-4ubuntu0.3",
           "7.6p1-4ubuntu0.2",
           "7.6p1-4ubuntu0.1"],
         "18.10"=>["7.7p1-4ubuntu0.3", "7.7p1-4ubuntu0.2", "7.7p1-4ubuntu0.1"],
         "19.04"=>[],
         "19.10"=>["8.0p1-6ubuntu0.1", "8.0p1-6build1", "8.0p1-4build1"],
         "20.04"=>
          ["8.2p1-4ubuntu0.7",
           "8.2p1-4ubuntu0.6",
           "8.2p1-4ubuntu0.5",
           "8.2p1-4ubuntu0.4",
           "8.2p1-4ubuntu0.3",
           "8.2p1-4ubuntu0.2",
           "8.2p1-4ubuntu0.1"],
         "20.10"=>["8.3p1-1ubuntu0.1", "8.2p1-4ubuntu1"],
         "21.04"=>
          ["8.4p1-5ubuntu1.2",
           "8.4p1-5ubuntu1.1",
           "8.4p1-5ubuntu1",
           "8.4p1-4ubuntu2",
           "8.4p1-4ubuntu1",
           "8.4p1-4build2",
           "8.4p1-4build1"],
         "21.10"=>
          ["8.4p1-6ubuntu2.2",
           "8.4p1-6ubuntu2.1",
           "8.4p1-6ubuntu2",
           "8.4p1-6ubuntu1",
           "8.4p1-5ubuntu2"],
         "22.04"=>["8.9p1-3ubuntu0.1", "8.7p1-2build1"],
         "22.10"=>
          ["9.0p1-1ubuntu7.2",
           "9.0p1-1ubuntu7.1",
           "9.0p1-1ubuntu7",
           "9.0p1-1ubuntu6",
           "9.0p1-1ubuntu5",
           "9.0p1-1ubuntu4",
           "9.0p1-1ubuntu3",
           "9.0p1-1ubuntu2",
           "9.0p1-1ubuntu1"],
         "23.04"=>["9.0p1-1ubuntu8.1", "9.0p1-1ubuntu8"],
         "23.10"=>[]
         }

      def initialize(banner)
        @banner = banner
        @version = Ubuntu::Version.new(ubuntu_version_guess)
      end

      def common
        "ubuntu"
      end

      # Get the FINGERPRINTS constant hash, generated from the
      # scraping script.
      # @return [Hash<String, Array<String>>] FINGERPRINTS constant
      #   hash
      def fingerprints
        OS::Ubuntu::FINGERPRINTS
      end

      def ubuntu_version_guess
        possible_versions = []
        OS::Ubuntu::FINGERPRINTS.keys.each do |ubuntu_version|
          OS::Ubuntu::FINGERPRINTS[ubuntu_version].uniq.each do |banner|
            openssh_ps, ubuntu_sig = banner.split("-")
            openssh_version = openssh_ps
            # If the version is like 6.6p1, deduce that
            if openssh_ps.include?("p")
              openssh_version = openssh_ps.split("p")[0]
            end
            if @banner.include?("OpenSSH_#{openssh_version}") &&
               @banner.include?(ubuntu_sig)
              possible_versions << ubuntu_version
            end
          end
        end
        possible_versions.uniq!
        if possible_versions.any?
          return possible_versions.join("|")
        end
        return nil
      end

      def cpe
        "o:canonical:ubuntu" + (@version.to_s ? ":#{@version}" : "")
      end
    end
  end
end
