/* Copyright 2016 by Chris Osborn <fozztexx@fozztexx.com>
 * http://insentricity.com
 *
 * $Id$
 */

#import <ClearLake/ClearLake.h>

#include <math.h>

#define BLOCK	30
#define CHARW	(BLOCK * 5 / 2)

CLString *font[] = {
  @"D-18T94M-143T94MU220T58MD-148T39MU-50T38M140T",
  @"D90M-116T67M220T61M-208T61M220T67MU-206T74M90T",
  @"-33T108MD160T74M-253T74MU36T14M90T",
  @"D90M-126T74M253T74MU-216T74M90T",
  @"-33T108MD123T60M-270T90M90T60MU108T47MD71T44MU-211T87M121T",
  @"-33T108MD123T60M-270T90MU135T63MD134T44MU-211T87M121T",
  @"-44T84MD89T42M101T54M-292T54M101T42M135T30MU-213T54M123T",
  @"90MD-180T90MU90T60MD90T90MU126T74MD-216T60MU-71T47M161T",
  @"90MD-90T60MU236T108MD-236T60MU108T94MD-198T90MU90T44M90T",
  @"-33T108MD-146T60M315T42M-90T42MU-156T80M111T",
  @"90MD-180T90MU146T108MD160T74M-253T74MU36T14M90T",
  @"90MD-180T90M90T60MU14M90T",
  @"D90M-153T67M126T67M-153T90MU90T14M90T",
  @"D90M-146T108M146T90MU-170T91M170T",
  @"D90M-90T60M-90T90M270T60MU-180T74M90T",
  @"D90M-116T67M233T67MU-228T80M111T",
  @"-90T60MD90T90M90T60M-270T90M90T60M135T42MU-168T54M123T",
  @"D90M-116T67M233T67M-233T67MU26T14M90T",
  @"D-63T67M126T67M-126T67MU-107T91M170T",
  @"90MD-90T60MU251T94MD-161T90MU-153T100M153T",
  @"90MD-180T90M90T60M90T90MU-170T91M170T",
  @"90MD-161T94M143T94MU-152T91M170T",
  @"90MD-170T91M156T61M-151T61M156T91MU-161T91M170T",
  @"90MD-146T108MU146T90MD146T108MU-236T74M90T",
  @"90MD-135T42M90T42MU206T94MD-161T60MU-143T74M143T",
  @"90MD-90T60M236T108M-236T60MU14M90T",
  @"-45T84MD135T30M45T42M-270T42M45T30M90T60MU-166T61M166T",
  @"90MD-180T90M116T67M126T67MU-192T95M128T",
  @"-45T84MD161T67M-233T67MU26T14M90T",
  @"-33T108MD-146T90M243T67M-126T67MU-102T61M166T",
  @"30MD-90T60M135T42M90T42M-270T42M45T30MU14M90T",
  @"-90T14MD90T60M-45T42MU211T61MD-76T30MU-206T66M116T",
  @"-135T42MD90T42M45T30M45T42M90T42M-270T42M90T42MU-108T33M153T",
  @"90MD-180T90MU180T60MD-90T60M-90T60MU90T14M90T",
  @"-7T60MD-172T60MU185T82MD-50T10M-90T10M270T10M-90T10MU-205T87M160T",
  @"-32T97MD-12T10M-90T10M270T10M-90T10MU-206T23MD-18T60M315T42M-90T42MU-135T82M90T",
  @"90MD-180T90MU139T69MD157T50M-233T67MU26T14M90T",
  @"-90T15MD90T90M90T15MU-270T90MD90T30MU14M90T",
  @"D-14T61M-139T33M126T33M-139T61MU76T14M90T",
  @"D60MU-180T16MD119T34M-58T34M-60T43MU90T14M90T",
  @"60MD-90T60M-90T60M270T60M-90T60MU-128T95M128T",
  @"-180T30MD180T90MU-180T15MD116T33M-71T42M251T67MU-206T74M90T",
  @"-116T67MD161T21M-45T75M123T54M-247T54MU33T30M90T",
  @"D60MU-90T60MD195T62MU-225T86M119T",
  @"D-74T62M139T66M-139T62MU-92T63M166T",
  @"-9T91MD-170T60M45T42MU171T74MD-126T30MU-63T67M153T",
  @"60MD-180T60M90T60M90T60MU-166T61M166T",
  @"60MD-153T67M126T67MU-139T61M166T",
  @"60MD-165T61M139T33M-126T33M139T61MU-152T61M166T",
  @"D-45T84MU135T60MD-225T84MU45T14M90T",
  @"-180T30MD146T108MU123T60MD-236T54MU37T47M108T",
  @"-90T60MD180T60M-135T84M135T60MU-218T95M128T",
  @"-18T94MD165T55M-292T52M111T54M67T54MU-187T100M153T",
  @"-90T15MD90T90M153T33MU-306T67M153T",
  @"60MD-45T42M-90T42M270T84M-225T60MU14M90T",
  @"74MD-63T33M-71T42M254T34M-232T32M248T42M-68T32MU-166T75M99T",
  @"90MD-180T60M90T60MU90T60MD-180T90MU90T14M90T",
  @"-33T108MD123T44M63T33M-269T67M233T67MU-206T74M90T",
  @"-33T108MD150T67M-296T30M45T42M89T42M90T42M90T42MU-246T80M111T",
  @"89MD-90T60M236T108MU-236T74M90T",
  @"-90T0MD60M90T90M90T60M-270T90MU127T75MD143T60MU-211T87M120T",
  @"-90T60MD90T89M116T67M-233T67MU-36T33M153T",
};

int main(int argc, char *argv[])
{
  CLAutoreleasePool *pool;
  int count;
  CLMutableString *message, *terraspin;
  int pos, lines, max, c, lnum, letter;
  double top, left, angle;


  pool = [[CLAutoreleasePool alloc] init];

  count = CLGetArgs(argc, argv, @"");

  if (count < 0) {
    if (count < 0 && -count != '-')
      fprintf(stderr, "Bad flag: %c\n", -count);
    fprintf(stderr, "Usage: %s [-flags] message\n"
	                "Flags are:\n"
	    , *argv);
    exit(1);
  }

  message = [[CLMutableString alloc] init];
  for (; count < argc; count++) {
    if ([message length])
      [message appendString:@" "];
    [message appendFormat:@"%s", argv[count]];
  }

  max = [message length];
  if (max > 52)
    max = 52;
  lines = (max + 12) / 13;
  top = BLOCK * 4 * lines / 2;
  left = 13 * CHARW / 2;
  angle = atan(top / -left) * 180 / M_PI;
  angle += 180;

  lnum = 6000;
  
  terraspin = [[CLMutableString alloc] init];
  [terraspin appendFormat:@"%iT%iM%iT",
	     (int) (angle - 90), (int) sqrt(top * top + left * left), (int) (90 - angle)];

  for (pos = 0; pos < max; pos++) {
    if (pos && !(pos % 13)) {
      top = BLOCK * 6;
      left = (12 + (pos == 26)) * CHARW;
      angle = (-top / -left) * 180 / M_PI;
      angle += 180;
      [terraspin appendFormat:@"%iT%iM%iT",
		 (int) (angle - 90), (int) sqrt(top * top + left * left), (int) (90 - angle)];
    }
    
    c = [message characterAtIndex:pos];
    if (c >= 'A' && c <= 'Z')
      letter = c - 'A';
    else if (c >= 'a' && c <= 'z')
      letter = c - 'a' + 26;
    else if (c >= '0' && c <= '9')
      letter = c - '0' + 52;
    else
      letter = -1;

    if (letter >= 0 && letter < 62)
      [terraspin appendString:font[letter]];
    else if (c == ' ')
      [terraspin appendFormat:@"-90T%iM90T", CHARW];
    
    if ([terraspin length] >= 30) {
      printf("%i DATA %s\n", lnum, [terraspin UTF8String]);
      lnum += 10;
      [terraspin setString:@""];
    }
  }

  if ([terraspin length]) {
    printf("%i DATA %s\n", lnum, [terraspin UTF8String]);
    lnum += 10;
  }

  printf("%i DATA \"\"\n", lnum);
  
  [terraspin release];
  [message release];
  
  [pool release];
  exit(0);
}
