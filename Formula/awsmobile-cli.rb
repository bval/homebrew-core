require "language/node"

class AwsmobileCli < Formula
  desc "Easy incorporation of aws features into your mobile project"
  homepage "https://github.com/aws/awsmobile-cli"
  url "https://registry.npmjs.org/awsmobile-cli/-/awsmobile-cli-1.1.7.tgz"
  sha256 "1249d8af429896286cd48245bd4cbb3466ff9d54ed28335855c7be51f708932d"

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    output = shell_output("#{bin}/awsmobile -V")
    assert_match version, output
  end
end
