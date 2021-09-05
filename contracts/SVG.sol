// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;
import './base64.sol';
import "@openzeppelin/contracts/utils/Strings.sol";

contract WithSVG { 
	struct SNFTColors {
		string fill1;
		string fill2;
		string fill3;
		string fill4;
		string fill5;
	}
	SNFTColors[6] private NFTColors;
	uint256[6] private NFTStatusBreakdown;

	function setColors(string memory colorOff, string memory color1, string memory color2, string memory color3, string memory color4, string memory color5) internal {
		//OSMIUM
		NFTColors[5].fill1 = color1;
		NFTColors[5].fill2 = color2;
		NFTColors[5].fill3 = color3;
		NFTColors[5].fill4 = color4;
		NFTColors[5].fill5 = color5;

		//GOLD
		NFTColors[4].fill1 = colorOff;
		NFTColors[4].fill2 = color2;
		NFTColors[4].fill3 = color3;
		NFTColors[4].fill4 = color4;
		NFTColors[4].fill5 = color5;

		//SILVER
		NFTColors[3].fill1 = colorOff;
		NFTColors[3].fill2 = colorOff;
		NFTColors[3].fill3 = color3;
		NFTColors[3].fill4 = color4;
		NFTColors[3].fill5 = color5;

		//COOPER
		NFTColors[2].fill1 = colorOff;
		NFTColors[2].fill2 = colorOff;
		NFTColors[2].fill3 = colorOff;
		NFTColors[2].fill4 = color4;
		NFTColors[2].fill5 = color5;

		//ZINC
		NFTColors[1].fill1 = colorOff;
		NFTColors[1].fill2 = colorOff;
		NFTColors[1].fill3 = colorOff;
		NFTColors[1].fill4 = colorOff;
		NFTColors[1].fill5 = color5;

		//PAPER
		NFTColors[0].fill1 = colorOff;
		NFTColors[0].fill2 = colorOff;
		NFTColors[0].fill3 = colorOff;
		NFTColors[0].fill4 = colorOff;
		NFTColors[0].fill5 = colorOff;
	}

	function setBreakdown(uint256 breakdown0, uint256 breakdown1, uint256 breakdown2, uint256 breakdown3, uint256 breakdown4) internal {
		NFTStatusBreakdown[0] = breakdown0;
		NFTStatusBreakdown[1] = breakdown1;
		NFTStatusBreakdown[2] = breakdown2;
		NFTStatusBreakdown[3] = breakdown3;
		NFTStatusBreakdown[4] = breakdown4;
	}

	function toAsciiString(address x) internal pure returns (string memory) {
		bytes memory s = new bytes(40);
		for (uint i = 0; i < 20; i++) {
			bytes1 b = bytes1(uint8(uint(uint160(x)) / (2**(8*(19 - i)))));
			bytes1 hi = bytes1(uint8(b) / 16);
			bytes1 lo = bytes1(uint8(b) - 16 * uint8(hi));
			s[2*i] = char(hi);
			s[2*i+1] = char(lo);			
		}
		return string(s);
	}

	function char(bytes1 b) internal pure returns (bytes1 c) {
		if (uint8(b) < 10) return bytes1(uint8(b) + 0x30);
		else return bytes1(uint8(b) + 0x57);
	}

	function _getArtStatus(uint256 totalGrant) internal view returns (uint256) {
		if (totalGrant < NFTStatusBreakdown[0]) {
			return 0;
		} else if (totalGrant < NFTStatusBreakdown[1]) {
			return 1;
		} else if (totalGrant < NFTStatusBreakdown[2]) {
			return 2;
		} else if (totalGrant < NFTStatusBreakdown[3]) {
			return 3;
		} else if (totalGrant < NFTStatusBreakdown[4]) {
			return 4;
		} else if (totalGrant >= NFTStatusBreakdown[4]) {
			return 5;
		} else {
			return 0;
		}
	}
	function _getArtMosaic(uint256 status) internal view returns (string memory) {
		string memory color1 = NFTColors[status].fill1;
		string memory color2 = NFTColors[status].fill2;
		string memory color3 = NFTColors[status].fill3;
		string memory color4 = NFTColors[status].fill4;
		string memory color5 = NFTColors[status].fill5;

		string memory firstRow = string(abi.encodePacked(
				'<path fill="',color2,'" d="M25,21.14h0A52.8,52.8,0,0,1,76.8,73.8v0a0,0,0,0,1,0,0H25a0,0,0,0,1,0,0V21.14A0,0,0,0,1,25,21.14Z" transform="translate(101.47 94.6) rotate(-180)"/><rect fill="',color4,'" x="76.8" y="21" width="52.8" height="52.8" rx="26.4"/><polyline fill="',color1,'" points="129.6 73.8 129.6 21 182.4 21"/><rect fill="',color5,'" x="182.4" y="21" width="52.8" height="52.8"/><rect fill="',color3,'" x="235.1" y="21" width="52.8" height="52.8"/>'
		));
		string memory secondRow = string(abi.encodePacked(
				'<rect fill="',color1,'" x="24" y="73.8" width="52.8" height="52.8"/><path fill="',color3,'" d="M76.43,72.52h0a52.8,52.8,0,0,1,52.8,52.8v0a0,0,0,0,1,0,0H76.43a0,0,0,0,1,0,0V72.52A0,0,0,0,1,76.43,72.52Z" transform="translate(4.3 203) rotate(-90)"/><rect fill="',color2,'" x="129.6" y="73.8" width="52.8" height="52.8"/><rect fill="',color1,'" x="182.4" y="73.8" width="52.8" height="52.8" rx="26.4"/><path fill="',color4,'" d="M235.1,73.8h0A52.8,52.8,0,0,1,288,126.6v0a0,0,0,0,1,0,0H235.1a0,0,0,0,1,0,0V73.8A0,0,0,0,1,235.1,73.8Z"/>'
		));

		string memory thirdRow = string(abi.encodePacked(
			'<rect fill="',color3,'" x="24" y="126.6" width="52.8" height="52.8" rx="26.4"/><polyline fill="',color5,'" points="76.8 179.4 76.8 126.6 129.6 126.6"/><rect fill="',color4,'" x="129.6" y="126.6" width="52.8" height="52.8"/><polyline fill="',color3,'" points="182.4 126.6 235.1 126.6 235.1 179.4"/><polyline fill="',color5,'" points="288 126.6 288 179.4 235.1 179.4"/>'
		));
		string memory fourthRow = string(abi.encodePacked(
			'<path fill="',color4,'" d="M25,179.4h0a52.8,52.8,0,0,1,52.8,52.8v0a0,0,0,0,1,0,0H25a0,0,0,0,1,0,0V179.4A0,0,0,0,1,25,179.4Z" transform="translate(102 412) rotate(-180)"/><rect fill="',color2,'" x="76.8" y="179.4" width="52.8" height="52.8"/><path fill="',color1,'" d="M129.6,179.4h0a52.8,52.8,0,0,1,52.8,52.8v0a0,0,0,0,1,0,0H129.6a0,0,0,0,1,0,0V179.4A0,0,0,0,1,129.6,179.4Z"/><rect fill="',color5,'" x="182.4" y="179.4" width="52.8" height="52.8"/><rect fill="',color2,'" x="235.1" y="179.4" width="52.8" height="52.8" rx="26.4"/>'
		));
		return (
			string(abi.encodePacked(
				firstRow,
				secondRow,
				thirdRow,
				fourthRow
			))
		);
	}
	function _getArtGrade(uint256 status) internal pure returns (string memory) {
		if (status == 0) {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">PAPER</text>');
		} else if (status == 1) {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">ZINC</text>');
		} else if (status == 2) {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">COPPER</text>');
		} else if (status == 3) {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">SILVER</text>');
		} else if (status == 4) {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">GOLD</text>');
		} else {
			return ('<text x="24" y="320" font-size="50" fill="#FFF" font-weight="800">OSMIUM</text>');
		}
	}
	function _getArtText(uint256 decimals, uint256 totalGrants, uint256 totalShares, uint256 beneficiari, string memory symbol) internal pure returns (string memory) {
		uint256 yield = 0;
		string memory yieldSign = "";

		if (totalShares >= totalGrants) {
			yield = totalShares - totalGrants;
		} else {
			yieldSign = "-";
			yield = totalGrants - totalShares;
		}

		return (string(abi.encodePacked(
			string(abi.encodePacked(
				'<text x="24" y="366">VALUE</text><text class="text-right" x="288" y="366">',
				Strings.toString(totalGrants / 10 ** decimals),
				'.',
				Strings.toString(totalGrants % 10 ** decimals),
				' ',
				symbol
			)),
			string(abi.encodePacked(
				'</text><text x="24" y="398">YIELD</text><text class="text-right" x="288" y="398">',
				yieldSign,
				Strings.toString(yield / 10 ** decimals),
				'.',
				Strings.toString(yield % 10 ** decimals),
				' ',
				symbol
			)),
			'</text><text x="24" y="430">BENEFICIARI</text><text class="text-right" x="288" y="430">',
			Strings.toString(beneficiari),'</text>'
		)));
	}


}
